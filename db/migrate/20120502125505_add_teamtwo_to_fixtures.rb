class AddTeamtwoToFixtures < ActiveRecord::Migration
  def change
    add_column :fixtures, :teamtwo_id, :integer

  end
end
