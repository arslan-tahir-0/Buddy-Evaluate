class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :reportable_type
      t.integer :reportable_id
      t.text :content, null: false, default: ''
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
