class User < ActiveRecord::Base
  has_one :api_access
  delegate :api_key, to: :api_access

  def self.create_with_api_key!(options)
    user = create! options
    ApiAccess.create_with_key! user
    user
  end
end
