# == Schema Information
#
# Table name: like_tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_id    :integer          not null
#  tag_id     :integer          not null
#
class LikeTag < ApplicationRecord
end
