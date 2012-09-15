class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.integer :Team1
      t.integer :Team2
      t.references :court
      t.string :Division
      t.date :date

      t.timestamps
    end
  end
end
