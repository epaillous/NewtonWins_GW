task load_media_from_aws: :environment do

# retrieve the access key and secret key
access_key_id = ENV['ACCESS_KEY_ID']
secret_access_key = ENV['SECRET_KEY_ACCESS']

# create an instance of the s3 client
Aws.config.update({
  region: 'eu-west-3',
  credentials: Aws::Credentials.new(access_key_id, secret_access_key),
  http_read_timeout: 120
  })

s3 = Aws::S3::Resource.new

# get the bucket
bucket = s3.bucket('newton-wins')

# retrieve the objects
bucket.objects.each do |object|
  name_file = object.key
  extension = File.extname(name_file)
  puts "current file name = #{name_file}"
  content_type = object.object.content_type
  if (content_type == 'image/jpeg' || content_type == 'image/png') && !name_file.include?(thumbnail_extension)
    media = Medium.find_by_url(object.public_url)
    if !media
      puts "media #{name_file} not found"
      thumbnail_key = name_file.gsub(extension, '') + thumbnail_extension + extension
      image = create_thumbnail(bucket, name_file, object.public_url, thumbnail_key, extension)
      thumbnail_path = object.public_url.gsub(extension, '') + thumbnail_extension + extension
      city_name = name_file.split('/')[2].downcase.gsub('_', ' ')
      city = City.where('unaccent(lower(name)) = unaccent(?)', city_name).first
      if city 
        Medium.create(point_id: city.point.id, url: object.public_url, title: city.name, thumbnail_url: thumbnail_path,
          thumbnail_width: image.width, thumbnail_height: image.height)
      end
    elsif !media.thumbnail_url
      puts "media #{name_file} found but no thumbnail associated"
      puts extension
      thumbnail_key = name_file.gsub(extension, '') + thumbnail_extension + extension
      image = create_thumbnail(bucket, name_file, object.public_url, thumbnail_key, extension)
      thumbnail_path = object.public_url.gsub(extension, '') + thumbnail_extension + extension
      media.update_attributes(thumbnail_url: thumbnail_path, thumbnail_width: image.width, thumbnail_height: image.height)
    else
      puts "media found #{media.id}, thumbnail associated : #{media.thumbnail_url}"
    end
  end
end

end

def create_file(path)
  dir = File.dirname(path)

  unless File.directory?(dir)
    FileUtils.mkdir_p(dir)
  end
  File.new(path, 'w')
end


def create_thumbnail(bucket, name_file, url, thumbnail_key, extension)
  if bucket.object(thumbnail_key).exists?
    puts 'thumbnail exists on S3'
    return MiniMagick::Image.open(url.gsub(extension, '') + thumbnail_extension + extension)
  end
  puts "creating thumbnail of #{name_file}"
  thumbnail_url = 'thumbnails/' + name_file.gsub(extension, '') + thumbnail_extension + extension
  image = MiniMagick::Image.open(url)
  image.resize "250x200"
  create_file(thumbnail_url)
  image.write(thumbnail_url)
  puts "uploading #{thumbnail_key} on S3"
  bucket.object(thumbnail_key).upload_file(image.path, acl:'public-read')
  return image
end


def thumbnail_extension 
  '_thumbnail'
end