class AddTeamoneToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :teamone_id, :integer

  end
end
