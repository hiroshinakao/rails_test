class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :clazz, index: true
      t.string :name

      t.timestamps
    end
  end
end
