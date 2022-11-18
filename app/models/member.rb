class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

  #memberとrelationshipの結びつけ(Relationships)
  #followedを利用してfollowingを参照できるように
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  #memberとrelationshipの結びつけ(reverse_of_relationships)
  #followingを利用してfollowedを参照できるように
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following

  #プロフィール写真の設定
  has_one_attached :profile_image

def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
end

def self.guest
  find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |member|
    member.password = SecureRandom.urlsafe_base64
    member.name = "guestuser"
  end
end

  # is_deletedがfalseならtrueを返すようにしている
def active_for_authentication?
  super && (is_deleted == false)
end

end
