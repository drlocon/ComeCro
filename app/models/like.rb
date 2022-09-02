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
  
  has_one_attached :like_image
  
  def get_like_image
    unless like_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      like_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    like_image.variant(resize_to_limit: [width, height]).processed
  end
end
