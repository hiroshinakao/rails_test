# == Schema Information
#
# Table name: examinations
#
#  id         :integer          not null, primary key
#  student_id :integer
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_examinations_on_student_id  (student_id)
#

class Examination < ActiveRecord::Base
  belongs_to :student
end
