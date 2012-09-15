class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :Mailing_ListID
      t.string :Title
      t.string :first_name
      t.string :last_name
      t.text :Address1
      t.text :Address2
      t.text :Address3
      t.text :Address4
      t.text :Address5
      t.string :Postal_Code
      t.string :Home_Phone
      t.string :Work_Phone
      t.references :division
      t.boolean :pot_luck
      t.string :email
      t.boolean :Over_55s

      t.timestamps
    end
  end
end
