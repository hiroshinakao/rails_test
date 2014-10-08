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

require 'rails_helper'

RSpec.describe Student, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
