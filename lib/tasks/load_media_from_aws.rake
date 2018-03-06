task load_media_from_aws: :environment do

# retrieve the access key and secret key
access_key_id = ENV['ACCESS_KEY_ID']
secret_access_key = ENV['SECRET_KEY_ACCESS']

# create an instance of the s3 client
Aws.config.update({
  region: 'eu-west-3',
  credentials: Aws::Credentials.new(access_key_id, secret_access_key)
  })

s3 = Aws::S3::Resource.new

# get the bucket
bucket = s3.bucket('newton-wins')

# retrieve the objects
bucket.objects.each do |object|
  name_file = object.key
  if name_file.ends_with?('.JPG')
    media = Medium.find_by_url(object.public_url)
    if !media 
      city_name = name_file.split('/')[2].downcase.gsub('_', ' ')
      city = City.where('unaccent(lower(name)) = unaccent(?)', city_name).first
      if city 
        Medium.create(point_id: city.point.id, url: object.public_url, title: city.name)
      end
    end
  end
end
end