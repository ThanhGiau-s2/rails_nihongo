class CreateLearningProcesses < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_processes do |t|
      t.integer :status, null: false, default: 1
      t.integer :vocabulary, null: false, default: 1
      t.integer :grammar, null: false, default: 1
      t.integer :conversation, null: false, default: 1
      t.integer :practice_reading, null: false, default: 1
      t.integer :practice_listening, null: false, default: 1
      t.integer :practice_exam, null: false, default: 1
      t.date :date, null: false
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
