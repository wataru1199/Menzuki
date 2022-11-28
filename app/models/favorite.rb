class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :review
  validates_uniqueness_of :review_id, scope: :member_id
  #特定のmember_idに対するreview_idは1つだけにする = 組み合わせは1つ

  
end
