class CreateJudges < ActiveRecord::Migration[6.0]
  def change
    create_table :judges do |t|

      t.timestamps
    end
  end
end
