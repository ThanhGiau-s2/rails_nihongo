class CreateVocabQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :vocab_questions do |t|
      t.string :question, null: false
      t.string :option_1, null: false
      t.string :option_2, null: false
      t.string :option_3, null: false
      t.string :option_4
      t.string :key_answer, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
