class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :playerone
      t.references :playertwo
      t.references :division

      t.timestamps
    end
  end
end
