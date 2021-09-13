class AddIndexesToColumns < ActiveRecord::Migration[5.2]
  def change
    add_index :blogs, :status
    add_index :suggestions, :status
  end
end
