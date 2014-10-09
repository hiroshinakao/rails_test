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
#  index_examinations_on_score       (score)
#  index_examinations_on_student_id  (student_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :examination do
    student nil
    score 1
  end
end
