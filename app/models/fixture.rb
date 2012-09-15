class Fixture < ActiveRecord::Base
  has_many :teams, :dependent => :destroy
  belongs_to :division
  belongs_to :court
  belongs_to :teamone, :class_name => "Team", :foreign_key => :teamone_id
  belongs_to :teamtwo, :class_name => "Team", :foreign_key => :teamtwo_id
end
