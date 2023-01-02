# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_23_153156) do
  create_table "alphabets", charset: "utf8mb3", force: :cascade do |t|
    t.string "romaji", null: false
    t.string "hiragana"
    t.string "katakana"
    t.string "mp3"
    t.integer "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hiragana"], name: "index_alphabets_on_hiragana", unique: true
    t.index ["katakana"], name: "index_alphabets_on_katakana", unique: true
  end

  create_table "conversations", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "content", null: false
    t.string "image"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_conversations_on_lesson_id"
  end

  create_table "grammar_questions", charset: "utf8mb3", force: :cascade do |t|
    t.string "question", null: false
    t.string "key_answer", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_grammar_questions_on_lesson_id"
  end

  create_table "grammars", charset: "utf8mb3", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_grammars_on_lesson_id"
  end

  create_table "learning_processes", charset: "utf8mb3", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.integer "vocabulary", default: 1, null: false
    t.integer "grammar", default: 1, null: false
    t.integer "conversation", default: 1, null: false
    t.integer "practice_reading", default: 1, null: false
    t.integer "practice_listening", default: 1, null: false
    t.integer "practice_exam", default: 1, null: false
    t.date "date", null: false
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_learning_processes_on_lesson_id"
    t.index ["student_id"], name: "index_learning_processes_on_student_id"
  end

  create_table "lessons", charset: "utf8mb3", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_lessons_on_title", unique: true
  end

  create_table "listening_exercises", charset: "utf8mb3", force: :cascade do |t|
    t.string "content", null: false
    t.string "part", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_listening_exercises_on_lesson_id"
  end

  create_table "mp3s", charset: "utf8mb3", force: :cascade do |t|
    t.string "practice_reading", null: false
    t.string "listening_exercises", null: false
    t.string "vocabulary", null: false
    t.string "conversation", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_mp3s_on_lesson_id"
  end

  create_table "practice_listenings", charset: "utf8mb3", force: :cascade do |t|
    t.string "part", null: false
    t.string "mp3", null: false
    t.string "image", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_practice_listenings_on_lesson_id"
  end

  create_table "practice_readings", charset: "utf8mb3", force: :cascade do |t|
    t.string "content", null: false
    t.string "mp3"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_practice_readings_on_lesson_id"
  end

  create_table "result_exam_details", charset: "utf8mb3", force: :cascade do |t|
    t.string "response", null: false
    t.integer "result", null: false
    t.bigint "result_exam_id"
    t.bigint "summary_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_exam_id"], name: "index_result_exam_details_on_result_exam_id"
    t.index ["summary_question_id"], name: "index_result_exam_details_on_summary_question_id"
  end

  create_table "result_exam_grammar_details", charset: "utf8mb3", force: :cascade do |t|
    t.string "response", null: false
    t.integer "result", null: false
    t.bigint "result_exam_grammar_id"
    t.bigint "grammar_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grammar_question_id"], name: "index_result_exam_grammar_details_on_grammar_question_id"
    t.index ["result_exam_grammar_id"], name: "index_result_exam_grammar_details_on_result_exam_grammar_id"
  end

  create_table "result_exam_grammars", charset: "utf8mb3", force: :cascade do |t|
    t.integer "score"
    t.integer "status", default: 0, null: false
    t.time "start_at", null: false
    t.time "end_at"
    t.time "finish_at"
    t.date "date", null: false
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_result_exam_grammars_on_lesson_id"
    t.index ["student_id"], name: "index_result_exam_grammars_on_student_id"
  end

  create_table "result_exam_vocab_details", charset: "utf8mb3", force: :cascade do |t|
    t.string "response", null: false
    t.integer "result", null: false
    t.bigint "result_exam_vocab_id"
    t.bigint "vocab_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["result_exam_vocab_id"], name: "index_result_exam_vocab_details_on_result_exam_vocab_id"
    t.index ["vocab_question_id"], name: "index_result_exam_vocab_details_on_vocab_question_id"
  end

  create_table "result_exam_vocabs", charset: "utf8mb3", force: :cascade do |t|
    t.integer "score"
    t.integer "status", default: 0, null: false
    t.time "start_at", null: false
    t.time "end_at"
    t.time "finish_at"
    t.date "date", null: false
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_result_exam_vocabs_on_lesson_id"
    t.index ["student_id"], name: "index_result_exam_vocabs_on_student_id"
  end

  create_table "result_exams", charset: "utf8mb3", force: :cascade do |t|
    t.integer "score"
    t.integer "status", default: 0, null: false
    t.time "start_at", null: false
    t.time "end_at"
    t.time "finish_at"
    t.date "date", null: false
    t.bigint "lesson_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_result_exams_on_lesson_id"
    t.index ["student_id"], name: "index_result_exams_on_student_id"
  end

  create_table "staffs", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.date "birthday", null: false
    t.integer "gender", null: false
    t.integer "status", default: 1, null: false
    t.string "number_phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "students", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "summary_questions", charset: "utf8mb3", force: :cascade do |t|
    t.string "question", null: false
    t.string "option1", null: false
    t.string "option2", null: false
    t.string "option3", null: false
    t.string "option4"
    t.string "key_answer", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_summary_questions_on_lesson_id"
  end

  create_table "vocab_questions", charset: "utf8mb3", force: :cascade do |t|
    t.string "question", null: false
    t.string "option1", null: false
    t.string "option2", null: false
    t.string "option3", null: false
    t.string "option4"
    t.string "key_answer", null: false
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_vocab_questions_on_lesson_id"
  end

  create_table "vocabularies", charset: "utf8mb3", force: :cascade do |t|
    t.string "furigana"
    t.string "kanji"
    t.string "mean"
    t.string "mp3"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_vocabularies_on_lesson_id"
  end

  add_foreign_key "conversations", "lessons"
  add_foreign_key "grammar_questions", "lessons"
  add_foreign_key "grammars", "lessons"
  add_foreign_key "learning_processes", "lessons"
  add_foreign_key "learning_processes", "students"
  add_foreign_key "listening_exercises", "lessons"
  add_foreign_key "mp3s", "lessons"
  add_foreign_key "practice_listenings", "lessons"
  add_foreign_key "practice_readings", "lessons"
  add_foreign_key "result_exam_details", "result_exams"
  add_foreign_key "result_exam_details", "summary_questions"
  add_foreign_key "result_exam_grammar_details", "grammar_questions"
  add_foreign_key "result_exam_grammar_details", "result_exam_grammars"
  add_foreign_key "result_exam_grammars", "lessons"
  add_foreign_key "result_exam_grammars", "students"
  add_foreign_key "result_exam_vocab_details", "result_exam_vocabs"
  add_foreign_key "result_exam_vocab_details", "vocab_questions"
  add_foreign_key "result_exam_vocabs", "lessons"
  add_foreign_key "result_exam_vocabs", "students"
  add_foreign_key "result_exams", "lessons"
  add_foreign_key "result_exams", "students"
  add_foreign_key "summary_questions", "lessons"
  add_foreign_key "vocab_questions", "lessons"
  add_foreign_key "vocabularies", "lessons"
end
