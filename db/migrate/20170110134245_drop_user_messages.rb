class DropUserMessages < ActiveRecord::Migration
  def up
    drop_table :user_messages
  end
end
