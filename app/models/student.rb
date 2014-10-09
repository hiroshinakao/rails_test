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

class Student < ActiveRecord::Base
  belongs_to :clazz
  has_one :grade, through: :clazz
  has_one :examination, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :clazz, presence: true
  validates :name, presence: true

  # クラスごとの優秀な生徒を抽出
  scope :top_score_in_each_clazz, -> {
    joins(:examination, :clazz).
    group(:clazz_id).
    having("MAX(examinations.score)")
  }

  # イイね数に並べる
  scope :rank_of_like_count, -> {
    joins(:likes).
    group("students.id").
    order("COUNT(likes.id) DESC")
  }

  # イイね数に並べる(Arel)
  scope :rank_of_like_count_arel, -> {
    like_table = Like.arel_table
    manager = arel_table.
    project(Arel.sql('students.*')).
    join(like_table, Arel::Nodes::InnerJoin).
    on(
      (like_table[:likeable_id].eq(arel_table[:id])).
      and(like_table[:likeable_type].eq(self.name))
    ).
    group(arel_table[:id]).
    order(like_table[:id].count.desc)
    find_by_sql(manager.to_sql)
  }
end
