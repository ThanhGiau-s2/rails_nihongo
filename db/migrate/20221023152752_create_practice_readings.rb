class CreatePracticeReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_readings do |t|
      t.string :content, null: false
      t.string :mp3
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
