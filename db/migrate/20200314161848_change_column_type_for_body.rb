class ChangeColumnTypeForBody < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :body, :text

    change_column :comments, :body, :text
  end
end
