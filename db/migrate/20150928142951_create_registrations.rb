class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.text :note
      t.datetime :created_at
      t.timestamps null: false
    end
    add_reference :registrations, :user, index: true, foreign_key: true
    add_reference :registrations, :event, index: true, foreign_key: true
  end
end
