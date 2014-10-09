# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  DatabaseRewinder.clean_all
  # ユーザー
  Faker::Config.locale = :en
  users =100.times.map do
     User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password * 2,
      confirmed_at: DateTime.now
    )
  end
  Faker::Config.locale = :ja

  # 学年
  %w(1 2 3).map do |grade_name|
    grade = Grade.create!(name: grade_name)

    # クラス
    %w(a b c).map do |clazz_name|
      clazz = Clazz.create!(grade: grade, name: clazz_name)

      # 生徒とテスト
      50.times do |i|
        student = clazz.students.create!(name: Faker::Name.name)
        exam = student.create_examination!(score: Random.rand(0..100))
      end
    end
  end

  # いいね
  users.each do |user|
    user.likes.create!(likeable: Grade.all.sample)
    user.likes.create!(likeable: Clazz.all.sample)
    user.likes.create!(likeable: Student.all.sample)
    user.likes.create!(likeable: Examination.all.sample)
  end
end
