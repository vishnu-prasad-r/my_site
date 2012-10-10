class Result < ActiveRecord::Base
  belongs_to :fixture
  belongs_to :team1, :class_name => "Team", :foreign_key => :team1
  belongs_to :team2, :class_name => "Team", :foreign_key => :team2
  attr_accessible :teamone , :teamtwo , :court , :date ,:set1team1,:set1team2,:set2team1,:set2team2,:set3team1,:set3team2,:team1,:team2,:fixture_id
end
