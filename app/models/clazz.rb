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

class Clazz < ActiveRecord::Base
  belongs_to :grade
  has_many :students, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :grade, presence: true
  validates :name, presence: true, uniqueness: { scope: :grade }

  # イイね数に並べる
  scope :rank_of_like_count, -> {
    joins(:likes).
    group("clazzs.id").
    order("COUNT(likes.id) DESC")
  }

  # イイね数に並べる(Arel)
  scope :rank_of_like_count_arel, -> {
    like_table = Like.arel_table
    manager = arel_table.
    project(Arel.sql('clazzs.*')).
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
