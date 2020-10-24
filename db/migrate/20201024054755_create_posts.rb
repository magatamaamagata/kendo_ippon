class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :judge_correct_id,   null: false
      t.integer :difficulity_id,     null: false
      t.integer :user,               null: false
      t.integer :exp,                null: false
      t.timestamps
    end
  end
end
