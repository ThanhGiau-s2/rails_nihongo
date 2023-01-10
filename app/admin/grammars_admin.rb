Trestle.resource(:grammars) do
  menu do
    group :document do
      item :grammars, icon: "fa fa-star"
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
  form do |grammar|
    text_field :title
    text_field :content
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
  #   params.require(:grammar).permit(:name, ...)
  # end
  controller do 
    def download_sample_csv
      csv = ExportCsvService.new Grammar.all, Grammar::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.sample,
          filename: "sample_list_of_grammars.csv" }
      end
    end
   
    def export_csv
      csv = ExportCsvService.new Grammar.all, Grammar::CSV_ATTRIBUTES
      respond_to do |format|
        format.csv { send_data csv.perform,
          filename: "list_of_grammars.csv" }
      end
    end

    def import_csv
      Grammar.import_file params[:file]
      redirect_to grammars_admin_index_path, notice: "The grammar was successfully imported."
    end
  end
end
