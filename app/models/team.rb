class Team < ActiveRecord::Base
 def Team_Name
    "#{self.playerone.Full_Name} #{"&"} #{self.playertwo.Full_Name}"
 end
  belongs_to :playerone, :class_name => "Player", :foreign_key => :playerone_id
  belongs_to :playertwo, :class_name => "Player", :foreign_key => :playertwo_id
  belongs_to :division
  #has_many :fixtures, :dependent => :destroy 
 # has_many :fixtures, :foreign_key => :teamone_id ,:dependent=>:destroy
  #has_many :fixtures, :foreign_key => :teamtwo_id ,:dependent=>:destroy
  #attr_accessible :score, :draw , :won , :lost
end