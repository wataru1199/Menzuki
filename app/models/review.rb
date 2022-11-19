class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category
  belongs_to :member

  has_one_attached :image

  validates :shop_name, presence: true
  validates :place, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [100, 100]).processed
  end

  def favorited_by?(member)
   favorites.exists?(member_id: member.id)
  end

end
