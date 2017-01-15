class CreateTodoos < ActiveRecord::Migration
  def change
    create_table :todoos do |t|
      t.string :name
      t.date :time
      t.string :priority

      t.timestamps null: false
    end
  end
end
