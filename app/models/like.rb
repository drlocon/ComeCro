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
end
