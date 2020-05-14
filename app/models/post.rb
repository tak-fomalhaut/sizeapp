class Post < ApplicationRecord
  validates :title, :text, :image, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  

end
