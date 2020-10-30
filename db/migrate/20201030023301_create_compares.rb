class CreateCompares < ActiveRecord::Migration[6.0]
  def change
    create_table :compares do |t|
      t.text :sprits
      t.text :posture
      t.text :bamboo
      t.text :position
      t.text :sword
      t.text :zanshin
      t.text :sprits2
      t.text :posture2
      t.text :bamboo2
      t.text :position2
      t.text :sword2
      t.text :zanshin2
      t.text :notice
      t.string :public, null: false
      t.references :skill,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
