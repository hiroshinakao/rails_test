class CreateClazzs < ActiveRecord::Migration
  def change
    create_table :clazzs do |t|
      t.references :grade, index: true
      t.string :name

      t.timestamps
    end
  end
end
