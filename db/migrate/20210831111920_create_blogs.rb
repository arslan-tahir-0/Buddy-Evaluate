class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :heading, null: false, default: ''
      t.text :content, null: false, default: ''

      t.timestamps
    end
  end
end
