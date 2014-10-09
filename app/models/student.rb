# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  clazz_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_students_on_clazz_id  (clazz_id)
#

class Student < ActiveRecord::Base
  belongs_to :clazz
  has_one :examination

  validates :clazz, presence: true
  validates :name, presence: true
end
