class ApiAccess < ActiveRecord::Base
  belongs_to :user

  def self.create_with_key!(user)
    create! user: user, api_key: gen_key
  end

  def self.gen_key
    SecureRandom.hex
  end

  private_class_method :gen_key
end
