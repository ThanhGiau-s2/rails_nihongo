Trestle.resource(:alphabets) do
  menu do
    group :library do
      item :alphabets, icon: "fa fa-star"
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
  form do |alphabet|
    row do
      col { text_field :romaji }
      col { text_field :hiragana }
      col { text_field :katakana }
    end

    row do
      col { text_field :mp3 }
      col { text_field :classify }
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
  #   params.require(:alphabet).permit(:name, ...)
  # end
end
