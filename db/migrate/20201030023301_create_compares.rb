class CreateCompares < ActiveRecord::Migration[6.0]
  def change
    create_table :compares do |t|
      t.text :continuation, null: false
      t.text :problem, null: false
      t.text :make_better, null: false
      t.text :notice
      t.integer :public_id, null: false
      t.references :skill,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
