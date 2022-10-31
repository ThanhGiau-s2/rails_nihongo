class CreateMp3s < ActiveRecord::Migration[7.0]
  def change
    create_table :mp3s do |t|
      t.string :practice_reading, null: false
      t.string :listening_exercises, null: false
      t.string :vocabulary, null: false
      t.string :conversation, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
