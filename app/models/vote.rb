# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_votes_on_picture_id  (picture_id)
#  index_votes_on_user_id     (user_id)
#

class Vote < ApplicationRecord
  belongs_to :picture
  belongs_to :user
end
