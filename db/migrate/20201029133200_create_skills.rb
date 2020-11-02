class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.integer :youtube,   null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
