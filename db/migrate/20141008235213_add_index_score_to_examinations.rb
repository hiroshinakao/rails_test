class AddIndexScoreToExaminations < ActiveRecord::Migration
  def change
    add_index :examinations, :score
  end
end
