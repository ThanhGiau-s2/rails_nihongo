Rails.application.routes.draw do
  devise_for :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Trestle::Engine.routes.draw do
    # alphabet
    get '/alphabets/download_sample_csv', :to => 'alphabets_admin/admin#download_sample_csv'
    get '/alphabets/export_csv', :to => 'alphabets_admin/admin#export_csv'
    post '/alphabets/import_csv', :to => 'alphabets_admin/admin#import_csv'
    # lesson
    get '/lessons/download_sample_csv', :to => 'lessons_admin/admin#download_sample_csv'
    get '/lessons/export_csv', :to => 'lessons_admin/admin#export_csv'
    post '/lessons/import_csv', :to => 'lessons_admin/admin#import_csv'
    # vocabulary
    get '/vocabularies/download_sample_csv', :to => 'vocabularies_admin/admin#download_sample_csv'
    get '/vocabularies/export_csv', :to => 'vocabularies_admin/admin#export_csv'
    post '/vocabularies/import_csv', :to => 'vocabularies_admin/admin#import_csv'
    # grammar
    get '/grammars/download_sample_csv', :to => 'grammars_admin/admin#download_sample_csv'
    get '/grammars/export_csv', :to => 'grammars_admin/admin#export_csv'
    post '/grammars/import_csv', :to => 'grammars_admin/admin#import_csv'
    # practice_reading
    get '/practice_readings/download_sample_csv', :to => 'practice_readings_admin/admin#download_sample_csv'
    get '/practice_readings/export_csv', :to => 'practice_readings_admin/admin#export_csv'
    post '/practice_readings/import_csv', :to => 'practice_readings_admin/admin#import_csv'
    # conversation
    get '/conversations/download_sample_csv', :to => 'conversations_admin/admin#download_sample_csv'
    get '/conversations/export_csv', :to => 'conversations_admin/admin#export_csv'
    post '/conversations/import_csv', :to => 'conversations_admin/admin#import_csv'
    # summary_question
    get '/summary_questions/download_sample_csv', :to => 'summary_questions_admin/admin#download_sample_csv'
    get '/summary_questions/export_csv', :to => 'summary_questions_admin/admin#export_csv'
    post '/summary_questions/import_csv', :to => 'summary_questions_admin/admin#import_csv'
    # grammar_question
    get '/grammar_questions/download_sample_csv', :to => 'grammar_questions_admin/admin#download_sample_csv'
    get '/grammar_questions/export_csv', :to => 'grammar_questions_admin/admin#export_csv'
    post '/grammar_questions/import_csv', :to => 'grammar_questions_admin/admin#import_csv'
    # vocab_question
    get '/vocab_questions/download_sample_csv', :to => 'vocab_questions_admin/admin#download_sample_csv'
    get '/vocab_questions/export_csv', :to => 'vocab_questions_admin/admin#export_csv'
    post '/vocab_questions/import_csv', :to => 'vocab_questions_admin/admin#import_csv'
  end
end
