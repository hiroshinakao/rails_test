# -*- coding: utf-8 -*-
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

require 'rails_helper'

RSpec.describe Examination, :type => :model do
  before do
    @grade = create(:grade, name: Faker::Company.name)
    @clazz = create(:clazz, grade: @grade, name: Faker::Company.name)
    @student1 = create(:student, clazz: @clazz, name: Faker::Name.name)
    @student2 = create(:student, clazz: @clazz, name: Faker::Name.name)
    @student3 = create(:student, clazz: @clazz, name: Faker::Name.name)
    @exam1 = create(:examination, student: @student1, score: 0)
    @exam2 = create(:examination, student: @student2, score: 0)
    @exam3 = create(:examination, student: @student3, score: 0)

    Faker::Config.locale = :en
    @user1 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    @user2 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    @user3 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    @user4 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    @user5 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    @user6 = create(:user, email: Faker::Internet.email, password: Faker::Internet.password * 2, confirmed_at: DateTime.now)
    Faker::Config.locale = :ja
  end

  describe :rank_of_like_count do
    before do
      @user1.likes.create(likeable: @exam1)
      @user2.likes.create(likeable: @exam2)
      @user3.likes.create(likeable: @exam3)
      @user4.likes.create(likeable: @exam2)
      @user5.likes.create(likeable: @exam2)
      @user6.likes.create(likeable: @exam1)
    end

    it "イイね数が多い順に取得すること" do
      expect(Examination.rank_of_like_count).to eq([@exam2, @exam1, @exam3])
    end

    it "イイね数が多い順に取得すること(Arel)" do
      expect(Examination.rank_of_like_count_arel).to eq([@exam2, @exam1, @exam3])
    end
  end
end
