Trestle.resource(:learning_processes) do
  menu do
    group :user do
      item :learning_processes, icon: "fa fa-star"
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
  form do |learning_process|
    row do
      col { text_field :status }
      col { text_field :vocabulary }
    end
  
    row do
      col { text_field :grammar }
      col { text_field :conversation }
    end
    
    row do
      col { text_field :practice_reading }
      col { text_field :practice_listening }
    end
    
    row do
      col { text_field :practice_reading }
      col { datetime_field :date }
    end
    
    row do
      col { select :lesson_id, Lesson.all, include_blank: "- Select Lesson -" }
      col { select :student_id, Student.all, include_blank: "- Select Student -" }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:learning_process).permit(:name, ...)
  # end
end
