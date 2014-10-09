# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Grade, :type => :model do
  before do
    @grade1 = create(:grade, name: Faker::Company.name)
    @grade2 = create(:grade, name: Faker::Company.name)
    @grade3 = create(:grade, name: Faker::Company.name)

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
      @user1.likes.create(likeable: @grade1)
      @user2.likes.create(likeable: @grade2)
      @user3.likes.create(likeable: @grade3)
      @user4.likes.create(likeable: @grade2)
      @user5.likes.create(likeable: @grade2)
      @user6.likes.create(likeable: @grade1)
    end

    it "イイね数が多い順に取得すること" do
      expect(Grade.rank_of_like_count).to eq([@grade2, @grade1, @grade3])
    end

    it "イイね数が多い順に取得すること(Arel)" do
      expect(Grade.rank_of_like_count_arel).to eq([@grade2, @grade1, @grade3])
    end
  end
end
