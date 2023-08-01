class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :channel, foreign_key: true
      t.string :title, null: false
      t.string :url, limit: 8000, null: false

      t.timestamps
    end

    add_index :items, [:channel_id, :url], unique: true
  end
end
