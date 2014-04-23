class User < ActiveRecord::Base
  has_many :people
  has_many :companies

  def self.find_or_create_from_auth_hash(auth_hash)
    user = self.find_or_create_by(provider: auth_hash["provider"], uid: auth_hash["uid"])
    if user.name != auth_hash["info"]["name"]
      user.name = auth_hash["info"]["name"]
      user.save
    end
    user
  end
end
