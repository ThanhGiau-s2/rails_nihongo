class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.string :content, null: false
      t.string :image
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
