Trestle.resource(:vocabularies) do
  menu do
    group :document do
      item :vocabularies, icon: "fa fa-star"
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
  form do |vocabulary|
    row do
      col { text_field :furigana }
      col { text_field :kanji }
    end

    row do
      col { text_field :mean }
      col { text_field :mp3 }
    end

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
  #   params.require(:vocabulary).permit(:name, ...)
  # end
  controller do 
    def download_sample_csv
      csv = ExportCsvService.new Vocabulary.all, Vocabulary::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.sample,
          filename: "sample_list_of_vocabularies.csv" }
      end
    end
   
    def export_csv
      csv = ExportCsvService.new Vocabulary.all, Vocabulary::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.perform,
          filename: "list_of_vocabularies.csv" }
      end
    end

    def import_csv
      Vocabulary.import_file params[:file]
      redirect_to vocabularies_admin_index_path, notice: "The vocabulary was successfully imported."
    end
  end
end
