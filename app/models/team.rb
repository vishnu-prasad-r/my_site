class Team < ActiveRecord::Base
 def Team_Name
    "#{self.playerone.Full_Name} #{"&"} #{self.playertwo.Full_Name}"
 end
  belongs_to :playerone, :class_name => "Player", :foreign_key => :playerone_id, :dependent => :destroy
  belongs_to :playertwo, :class_name => "Player", :foreign_key => :playertwo_id, :dependent => :destroy
  belongs_to :division
  has_many :fixtures, :dependent => :destroy
end