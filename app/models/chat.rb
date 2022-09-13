# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  message    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer          not null
#  user_id    :integer          not null
#
class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
