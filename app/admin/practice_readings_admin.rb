Trestle.resource(:practice_readings) do
  menu do
    group :document do
      item :practice_readings, icon: "fa fa-star"
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
  form do |practice_reading|
    text_field :content
    file_field :mp3
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
  #   params.require(:practice_reading).permit(:name, ...)
  # end
  controller do 
    def download_sample_csv
      csv = ExportCsvService.new PracticeReading.all, PracticeReading::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.sample,
          filename: "sample_list_of_practice_readings.csv" }
      end
    end
   
    def export_csv
      csv = ExportCsvService.new PracticeReading.all, PracticeReading::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.perform,
          filename: "list_of_practice_readings.csv" }
      end
    end

    def import_csv
      PracticeReading.import_file params[:file]
      redirect_to practice_readings_admin_index_path, notice: "The practice reading was successfully imported."
    end
  end
end
