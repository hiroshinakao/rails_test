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

require 'rails_helper'

RSpec.describe Clazz, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
