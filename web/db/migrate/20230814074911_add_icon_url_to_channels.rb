class AddIconUrlToChannels < ActiveRecord::Migration[7.0]
  def change
    add_column :channels, :icon_url, :string, limit: 8000
  end
end
