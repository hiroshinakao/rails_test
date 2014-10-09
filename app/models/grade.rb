# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Grade < ActiveRecord::Base
  has_many :clazzes, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
