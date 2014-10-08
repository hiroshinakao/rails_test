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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clazz do
    grade nil
    name "MyString"
  end
end
