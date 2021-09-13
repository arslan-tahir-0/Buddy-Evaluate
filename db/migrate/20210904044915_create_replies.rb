class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :content, null: false, default: ''
      t.string :replyable_type
      t.integer :replyable_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
