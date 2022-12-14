class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :member
  has_many :favorited_members, through: :favorites, source: :member

  has_one_attached :image

  validates :shop_name, presence: true
  validates :place, presence: true
  validates :category, presence: true


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

  def self.looks(word)
    where("shop_name LIKE?","%#{word}%").or(Review.where("review_cont LIKE?","%#{word}%").or(Review.where("place LIKE?","%#{word}%")))
  end

  def self.scores(review_score)
    if review_score.to_f <= 1 && review_score.to_f >= -1
      where(score: .. review_score.to_f)
    else
      all
    end
  end


end
