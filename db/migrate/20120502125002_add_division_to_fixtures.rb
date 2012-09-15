class AddDivisionToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :division_id, :integer

  end
end
