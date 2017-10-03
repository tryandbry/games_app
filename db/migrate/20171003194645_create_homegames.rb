class CreateHomegames < ActiveRecord::Migration
  def change
    create_table :homegames do |t|
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
      t.boolean :home
    end
  end
end
