# -*- coding: utf-8 -*-
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
  before do
    @grade = create(:grade, name: Faker::Company.name)
    @clazz1 = create(:clazz, grade: @grade, name: Faker::Company.name)
    @clazz2 = create(:clazz, grade: @grade, name: Faker::Company.name)
    @clazz3 = create(:clazz, grade: @grade, name: Faker::Company.name)

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
      @user1.likes.create(likeable: @clazz1)
      @user2.likes.create(likeable: @clazz2)
      @user3.likes.create(likeable: @clazz3)
      @user4.likes.create(likeable: @clazz2)
      @user5.likes.create(likeable: @clazz2)
      @user6.likes.create(likeable: @clazz1)
    end

    it "イイね数が多い順に取得すること" do
      expect(Clazz.rank_of_like_count).to eq([@clazz2, @clazz1, @clazz3])
    end
  end
end
