# -*- coding: utf-8 -*-
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
  before do
    @grade = create(:grade)
    @clazz1 = create(:clazz, grade: @grade, name: Faker::Company.name)
    @clazz2 = create(:clazz, grade: @grade, name: Faker::Company.name)
    @student11 = create(:student, clazz: @clazz1, name: Faker::Name.name)
    @student12 = create(:student, clazz: @clazz1, name: Faker::Name.name)
    @student13 = create(:student, clazz: @clazz1, name: Faker::Name.name)
    @student21 = create(:student, clazz: @clazz2, name: Faker::Name.name)
    @student22 = create(:student, clazz: @clazz2, name: Faker::Name.name)
    @student23 = create(:student, clazz: @clazz2, name: Faker::Name.name)
  end

  describe :top_score_in_each_clazz do
    before do
      @student11.create_examination!(score: 0)
      @student12.create_examination!(score: 50)
      @student13.create_examination!(score: 100)
      @student21.create_examination!(score: 50)
      @student22.create_examination!(score: 100)
      @student23.create_examination!(score: 0)
    end

    it "各クラスの最高得点者を取得すること" do
      expect(Student.top_score_in_each_clazz).
        to match_array([@student13, @student22])
    end
  end
end
