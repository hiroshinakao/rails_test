# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    # クラスごとの最高得点者
    @excellent_students = Student.includes(:clazz, :grade, :examination).top_score_in_each_clazz

    #イイね数ランキング
    @grade_top = Grade.rank_of_like_count.first
    @clazz_top = Clazz.rank_of_like_count.first
    @student_top = Student.rank_of_like_count.first
    @examination_top = Examination.rank_of_like_count.first

    #イイね数ランキング(Arel)
    @grade_top_arel = Grade.rank_of_like_count_arel.first
    @clazz_top_arel = Clazz.rank_of_like_count_arel.first
    @student_top_arel = Student.rank_of_like_count_arel.first
    @examination_top_arel = Examination.rank_of_like_count_arel.first
  end
end
