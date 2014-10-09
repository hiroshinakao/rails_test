# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  likeable_id   :integer
#  likeable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#
# Indexes
#
#  index_likes_on_likeable_id_and_likeable_type  (likeable_id,likeable_type)
#  index_likes_on_user_id                        (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
    user nil
    likeable nil
  end
end
