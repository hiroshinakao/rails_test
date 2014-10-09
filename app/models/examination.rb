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

class Examination < ActiveRecord::Base
  belongs_to :student
  has_one :clazz, through: :student
  has_one :grade, through: :clazz
  has_many :likes, as: :likeable, dependent: :destroy

  validates :student, presence: true, uniqueness: true
  validates :score, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  # イイね数に並べる
  scope :rank_of_like_count, -> {
    joins(:likes).
    group("examinations.id").
    order("COUNT(likes.id) DESC")
  }

  # イイね数に並べる(Arel)
  scope :rank_of_like_count_arel, -> {
    like_table = Like.arel_table
    manager = arel_table.
    project(Arel.sql('examinations.*')).
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
