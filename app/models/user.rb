# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :pictures, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_pictures, through: :votes, source: :picture

  validates :name, presence: true
  validates :email, presence: true, 'valid_email_2/email': true
  

  def votable_for?(picture)
    picture && picture.user != self && !votes.exists?(picture_id: picture.id)
  end
end
