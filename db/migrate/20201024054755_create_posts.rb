class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :gif_url
      t.integer :judge_correct_id,   null: false
      t.integer :difficulity_id,     null: false
      t.integer :exp
      t.references :user,             null: false, foreign_key: true
      t.text :description, null:false
      t.timestamps
    end
  end
end
