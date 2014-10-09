# == Schema Information
#
# Table name: clazzs
#
#  id         :integer          not null, primary key
#  grade_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_clazzs_on_grade_id  (grade_id)
#

class Clazz < ActiveRecord::Base
  belongs_to :grade
  has_many :students, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :grade, presence: true
  validates :name, presence: true, uniqueness: { scope: :grade }
end
