class TeamGameAssociation < ActiveRecord::Migration
  def change
    change_table :game do |t|
      t.integer :teamhome
      t.integer :teamaway
    end

    add_foreign_key :teamhome, :teamaway
  end
end
