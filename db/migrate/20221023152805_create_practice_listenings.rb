class CreatePracticeListenings < ActiveRecord::Migration[7.0]
  def change
    create_table :practice_listenings do |t|
      t.string :part, null: false
      t.string :mp3, null: false
      t.string :image, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
