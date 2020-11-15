class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|
      t.integer :judge_correct_id,   null: false
      t.references :user,   null: false, foreign_key: true
      t.references :post,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
