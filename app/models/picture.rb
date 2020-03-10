# == Schema Information
#
# Table name: pictures
#
#  id         :bigint           not null, primary key
#  image      :text             not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_pictures_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :contributors, through: :votes, source: :user

  validates :image, presence: true
  validates :text, length: { in: 1..140 }
end
