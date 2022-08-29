class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|
      t.integer :user_id, null: false
      t.integer :like_id, null: false
      t.timestamps
    end
  end
end
