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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    clazz nil
    name "MyString"
  end
end
