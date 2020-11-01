class CreateCompares < ActiveRecord::Migration[6.0]
  def change
    create_table :compares do |t|
      t.text :sprits, null: false
      t.text :posture, null: false
      t.text :bamboo, null: false
      t.text :position, null: false
      t.text :sword, null: false
      t.text :zanshin, null: false
      t.text :sprits2, null: false
      t.text :posture2, null: false
      t.text :bamboo2, null: false
      t.text :position2, null: false
      t.text :sword2, null: false
      t.text :zanshin2, null: false
      t.text :notice, null: false
      t.string :public, null: false
      t.references :skill,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
