class CreateTeam < ActiveRecord::Migration
  def change
    create_table :team do |t|
      t.string :name
    end
  end
end
