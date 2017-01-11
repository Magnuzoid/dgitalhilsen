class RemoveShowAtUserIdFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :show_at, :user_id
  end
end
