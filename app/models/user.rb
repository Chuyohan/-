class User < ActiveRecord::Base
  has_many :active_relationships,  class_name: "Relationship",
                                   foreign_key: "follower_id",
                                   dependent: :destroy
 
  has_many :following, through: :active_relationships, source: :followed
  has_many :borders

  def follow(club)
    active_relationships.create(followed_id: club.id)
  end

  def unfollow(club)
    active_relationships.find_by(followed_id: club.id).destroy
  end

  def following?(club)
    following.include?(club)
  end

  def favorite
    @clubs = Club.where("id IN (?)", following_ids)
  end

  before_save { self.email = email.downcase }
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.email = "#{user.uid}@facebook.com"
      user.password = "123456789"
      user.save!
    end
  end
end