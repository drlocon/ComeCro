# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  content    :text
#  status     :integer          default(0), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Like < ApplicationRecord
  belongs_to :user
  
  has_many :like_tags, dependent: :destroy
  has_many :tags, through: :like_tags
  has_many :favorites, dependent: :destroy
  
  has_one_attached :like_image
  
  # 画像の設定
  def get_like_image
    unless like_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      like_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
  end
  
  # タグ機能の設定
  def save_tags(savelike_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - savelike_tags
    new_tags = savelike_tags - current_tags
    old_tags.each do |old_name|
      tags.delete Tag.find_by(name: old_name)
    end
    new_tags.each do |new_name|
      like_tag = Tag.find_or_create_by(name: new_name)
      tags << like_tag
    end
  end
  
  # お気に入り機能の設定
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
