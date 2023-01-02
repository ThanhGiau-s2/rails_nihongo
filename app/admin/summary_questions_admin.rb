Trestle.resource(:summary_questions) do
  menu do
    group :question do
      item :summary_questions, icon: "fa fa-star"
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
  form do |summary_question|
    text_field :question

    row do
      col { text_field :option_1 }
      col { text_field :option_2 }
    end

    row do
      col { text_field :option_3 }
      col { text_field :option_4 }
    end

    row do
      col { text_field :key_answer }
      col { select :lesson_id, Lesson.all, include_blank: "- Select Lesson -" }
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
  #   params.require(:summary_question).permit(:name, ...)
  # end
end
