Trestle.resource(:result_exam_vocab_details) do
  menu do
    group :exam do
      item :result_exam_vocab_details, icon: "fa fa-star"
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
  form do |result_exam_vocab_detail|
    text_field :response

    row do
      col { text_field :result }
      col { select :result_exam_vocab_id, ResultExamVocab.all, include_blank: "- Select Result Exam Vocab -" }
    end

    select :vocab_question_id, VocabQuestion.all, include_blank: "- Select Vocab Question -"
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:result_exam_vocab_detail).permit(:name, ...)
  # end
end
