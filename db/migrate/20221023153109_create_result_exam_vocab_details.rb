class CreateResultExamVocabDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :result_exam_vocab_details do |t|
      t.string :response, null: false
      t.integer :result, null: false
      t.references :result_exam_vocab, foreign_key: true
      t.references :vocab_question, foreign_key: true

      t.timestamps
    end
  end
end
