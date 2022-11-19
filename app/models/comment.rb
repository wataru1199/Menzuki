class Comment < ApplicationRecord
  
  belongs_to :member
  belongs_to :review
  
  validates :comment_cont, presence: true
  
end
