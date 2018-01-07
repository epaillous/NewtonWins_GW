class AuthenticatedController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

end
