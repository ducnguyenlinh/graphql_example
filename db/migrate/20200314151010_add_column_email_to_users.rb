class AddColumnEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email, :string, after: :name
  end
end
