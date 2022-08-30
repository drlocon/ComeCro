# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  introduction :text             not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer          not null
#
class Group < ApplicationRecord
end
