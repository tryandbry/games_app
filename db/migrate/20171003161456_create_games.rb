class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.timestamps
      t.integer :scorehome
      t.integer :scoreaway
    end
  end
end
