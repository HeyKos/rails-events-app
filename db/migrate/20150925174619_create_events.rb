class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.date :occurs_on

      t.timestamps null: false
    end
  end
end
