Trestle.resource(:result_exam_vocabs) do
  menu do
    group :exam do
      item :result_exam_vocabs, icon: "fa fa-star"
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
  form do |result_exam_vocab|
    row do
      col { text_field :score }
      col { text_field :status }
    end

    row do
      col { time_field :start_at }
      col { time_field :end_at }
      col { time_field :finish_at }
    end

    row do
      col { datetime_field :date }
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
  #   params.require(:result_exam_vocab).permit(:name, ...)
  # end
end
