class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :title, null: false
      t.string :url, limit: 8000, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end

    add_index :channels, :url, unique: true
    add_index :channels, :category
  end
end
