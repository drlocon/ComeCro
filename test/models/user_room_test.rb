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
require "test_helper"

class UserRoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
