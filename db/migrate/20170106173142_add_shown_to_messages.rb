class AddShownToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :show_at, :datetime
  end
end
