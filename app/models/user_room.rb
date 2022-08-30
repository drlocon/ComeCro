# == Schema Information
#
# Table name: user_rooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer          not null
#  user_id    :integer          not null
#
class UserRoom < ApplicationRecord
end
