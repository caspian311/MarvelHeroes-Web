class User < ActiveRecord::Base
  has_secure_password

  has_one :api_access
  delegate :api_key, to: :api_access
end
