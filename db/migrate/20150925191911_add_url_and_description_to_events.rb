class AddUrlAndDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :url, :string
    add_column :events, :description, :string
  end
end
