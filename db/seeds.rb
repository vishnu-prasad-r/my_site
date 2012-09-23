# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Division.create ([{:name=>"Division 1"},{:name=>"Division 2"},{:name=>"Division 3"},{:name=>"Division 4"},{:name=>"Premier"}])
Role.create ([{:name=>"DivisionOneManager"},{:name=>"DivisionTwoManager"},{:name=>"DivisionThreeManager"},{:name=>"DivisionFourManager"},{:name=>"Admin"}])


#importing player list

require 'csv'

@playercount=0
CSV.foreach("players2.csv") do |row|
   a=Player.create({:Mailing_ListID=>row[0],
      :Title=>row[1],
       :first_name=>row[2],
       :last_name=>row[3],
       :Address1=>row[4],
       :Address2=>row[5],
      :Address3=>row[6],
       :Address4=>row[7],
      :Address5=>row[8],
      :Postal_Code=>row[9],
       :Home_Phone=>row[10],
       :Work_Phone=>row[11],
       :division=> if row[12].to_i==0 then  nil else Division.find(row[12].to_i) end,


      :pot_luck=>row[13],
       :email=>row[14],
       :Over_55s=>row[15]})
       puts "Created player #{a.first_name} #{a.last_name}"
       @playercount=@playercount+1
    # use row here...
  end
puts "Total #{@playercount.to_s} players added to the database"

def to_boolean(string)
return false if string.nil?
string= string.downcase
return true if string== true || string =~ (/(true|t|yes|y|1)$/i)
return false if string== false || string.nil? || string =~ (/(false|f|no|n|0)$/i)
raise ArgumentError.new("invalid value for Boolean: \"#{string}\"")
end

@courtcount=0; 
CSV.foreach("courts2.csv") do |row|
  
  a= Court.create({:court=>row[0],
     :lights=>to_boolean(row[1]),
      :name=>row[2],
       :address=>row[3],
      :home=>row[4],
       :mobile=>row[5]})
  puts "Created court #{a.court}"
  @courtcount=@courtcount+1;
end
puts "Total #{@courtcount.to_s} courts added to the database"

@fixturecount=0;
CSV.foreach("fixtures2.csv") do |row|
  
  a= Court.create(  {  
    :court_id=>a[0],
    :date=>a[1],
    :division_id=>a[2],
    :teamone_id=>a[3],
    :teamtwo_id=>a[4]})
  puts "Created fixture #{a.date}"
  @fixturecount=@fixturecount+1;
end
puts "Total #{@fixturecount.to_s} fixtures imported into the database"