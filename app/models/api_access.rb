class ApiAccess < ActiveRecord::Base
  belongs_to :user

  validates :public_key, presence: true
  validates :private_key, presence: true

  def self.create_with_key! options
    create! options.merge api_key: gen_key
  end

  def self.gen_key
    SecureRandom.hex
  end

  private_class_method :gen_key
end
