class Player < ActiveRecord::Base
 def Full_Name
    "#{self.first_name} #{self.last_name}"
 end
 belongs_to :division
 

end
