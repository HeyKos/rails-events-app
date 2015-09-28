class CreateJoinTableCategoryEvent < ActiveRecord::Migration
  def change
    create_join_table :cateogries, :events do |t|
      # t.index [:cateogry_id, :event_id]
      # t.index [:event_id, :cateogry_id]
    end
  end
end
