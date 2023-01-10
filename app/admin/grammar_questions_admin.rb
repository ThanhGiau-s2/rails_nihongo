Trestle.resource(:grammar_questions) do
  menu do
    group :question do
      item :grammar_questions, icon: "fa fa-star"
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  form do |grammar_question|
    text_field :question
    text_field :key_answer
    select :lesson_id, Lesson.all, include_blank: "- Select Lesson -"
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:grammar_question).permit(:name, ...)
  # end
  controller do 
    def download_sample_csv
      csv = ExportCsvService.new GrammarQuestion.all, GrammarQuestion::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.sample,
          filename: "sample_list_of_grammar_questions.csv" }
      end
    end
   
    def export_csv
      csv = ExportCsvService.new GrammarQuestion.all, GrammarQuestion::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.perform,
          filename: "list_of_grammar_questions.csv" }
      end
    end

    def import_csv
      GrammarQuestion.import_file params[:file]
      redirect_to grammar_questions_admin_index_path, notice: "The grammar_question was successfully imported."
    end
  end
end
