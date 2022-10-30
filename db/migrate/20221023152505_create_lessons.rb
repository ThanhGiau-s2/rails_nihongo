class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.string :subtitle

      t.timestamps
    end
    
    add_index :lessons, :title, unique: true
  end
end
