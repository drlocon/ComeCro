# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_id    :integer          not null
#  user_id    :integer          not null
#
class Comment < ApplicationRecord
end
