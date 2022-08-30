# == Schema Information
#
# Table name: view_counts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_id    :integer          not null
#  user_id    :integer          not null
#
class ViewCount < ApplicationRecord
end
