class Post < ApplicationRecord
  validates :title, :text, :image, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  
end
