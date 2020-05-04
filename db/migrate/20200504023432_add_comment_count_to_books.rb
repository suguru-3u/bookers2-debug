class AddCommentCountToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :comment_count, :integer
  end
end
