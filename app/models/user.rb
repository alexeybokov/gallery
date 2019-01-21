class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and
  devise :database_authenticatable, :registerable, :recoverable,
         :confirmable, :rememberable, :validatable, :omniauthable,
         :lockable, :trackable, omniauth_providers: [:facebook]

  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :hearts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :activities, dependent: :destroy

  acts_as_follower

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def heart!(image)
    self.hearts.create(image_id: image.id)
  end

  def unheart!(image)
    heart = self.hearts.find_by(image_id: image.id)
    heart.destroy!
  end

  def heart?(image)
    self.hearts.find_by_image_id(image.id)
  end
end
