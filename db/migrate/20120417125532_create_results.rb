class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :fixture_id
      t.string   :teamone
      t.string   :teamtwo
      t.string   :court
      t.date     :date
      
      t.integer :set1team1
      t.integer :set1team2
      t.integer :set2team1
      t.integer :set2team2
      t.integer :set3team1
      t.integer :set3team2
      t.integer :team1
      t.integer :team2

      t.timestamps
    end
  end
end
