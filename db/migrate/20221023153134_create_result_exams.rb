class CreateResultExams < ActiveRecord::Migration[7.0]
  def change
    create_table :result_exams do |t|
      t.integer :score
      t.integer :status, null: false, default: 0
      t.time :start_at, null: false
      t.time :end_at
      t.time :finish_at
      t.date :date, null: false
      t.references :lesson, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
