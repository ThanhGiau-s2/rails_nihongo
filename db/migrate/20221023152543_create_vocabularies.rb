class CreateVocabularies < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabularies do |t|
      t.string :furigana
      t.string :kanji
      t.string :mean
      t.string :mp3
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
