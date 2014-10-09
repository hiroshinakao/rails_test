class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.references :student, index: true
      t.integer :score

      t.timestamps
    end
  end
end
