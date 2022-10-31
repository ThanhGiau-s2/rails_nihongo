class CreateGrammars < ActiveRecord::Migration[7.0]
  def change
    create_table :grammars do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
