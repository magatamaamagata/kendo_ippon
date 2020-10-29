class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :skill,   null: false
      t.references :user,             null: false, foreign_key: true
      t.text :description, null:false
      t.timestamps
    end
  end
end
