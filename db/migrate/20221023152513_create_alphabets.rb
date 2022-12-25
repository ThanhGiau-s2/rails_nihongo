class CreateAlphabets < ActiveRecord::Migration[7.0]
  def change
    create_table :alphabets do |t|
      t.string :romaji, null: false
      t.string :hiragana
      t.string :katakana
      t.string :mp3
      t.integer :classify, null: false

      t.timestamps
    end
    
    add_index :alphabets, :hiragana, unique: true
    add_index :alphabets, :katakana, unique: true
  end
end
