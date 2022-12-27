class Member < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favirited_reviews, through: :favorites, source: :review

  validates :name, presence: true
  validates :email, presence: true

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

def active_for_authentication?
  super && (is_deleted == false)
end

end
