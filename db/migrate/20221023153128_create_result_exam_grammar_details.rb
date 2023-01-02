class CreateResultExamGrammarDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :result_exam_grammar_details do |t|
      t.string :response, null: false
      t.integer :result, null: false
      t.references :result_exam_grammar, foreign_key: true
      t.references :grammar_question, foreign_key: true

      t.timestamps
    end
  end
end
