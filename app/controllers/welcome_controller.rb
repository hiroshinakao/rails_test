# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    # クラスごとの最高得点者
    @excellent_students = Student.top_score_in_each_clazz

    #イイね数ランキング
    @grade_top = Grade.rank_of_like_count.first
    @clazz_top = Clazz.rank_of_like_count.first
    @student_top = Student.rank_of_like_count.first
    @examination_top = Examination.rank_of_like_count.first
  end
end
