class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.timestamps
      t.integer :scorehome
      t.integer :scoreaway
      t.boolean :result
    end
  end
end
