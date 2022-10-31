class CreateGrammarQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :grammar_questions do |t|
      t.string :question, null: false
      t.string :key_answer, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
