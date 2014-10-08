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

require 'rails_helper'

RSpec.describe Examination, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
