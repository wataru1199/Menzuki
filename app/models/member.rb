class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #memberとrelationshipの結びつけ(Relationships)
  #followedを利用してfollowingを参照できるように
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  #memberとrelationshipの結びつけ(reverse_of_relationships)
  #followingを利用してfollowedを参照できるように
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following

end
