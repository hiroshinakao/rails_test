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

require 'rails_helper'

RSpec.describe Like, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
