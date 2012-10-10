class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :playerone
      t.references :playertwo
      t.references :division
      t.integer :won ,:default => 0
      t.integer :score,:default => 0
      t.integer :lost,:default => 0
      t.integer :draw,:default => 0
      t.timestamps
    end
  end
end
