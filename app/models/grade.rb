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

class Grade < ActiveRecord::Base
  has_many :clazzes, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  # イイね数に並べる
  scope :rank_of_like_count, -> {
    joins(:likes).
    group("grades.id").
    order("COUNT(likes.id) DESC")
  }

  # イイね数に並べる(Arel)
  scope :rank_of_like_count_arel, -> {
    like_table = Like.arel_table
    manager = arel_table.
    project(Arel.sql('grades.*')).
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
