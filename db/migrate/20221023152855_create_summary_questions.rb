class CreateSummaryQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :summary_questions do |t|
      t.string :question, null: false
      t.string :option1, null: false
      t.string :option2, null: false
      t.string :option3, null: false
      t.string :option4
      t.string :key_answer, null: false
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
