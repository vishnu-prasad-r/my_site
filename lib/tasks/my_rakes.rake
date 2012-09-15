desc "Import users." 
 task :import_users => :environment do
   File.open("players.csv", "r").each do |line|
     Mailing_ListID,Title,first_name,Last_Name,Address1,Address2,Address3,Address4,Address5,Postal_Code,Home_Phone,Work_Phone,Division,pot_luck,email,Over_55s = line.strip.split(",")
     u = Player.new(:Mailing_ListID => Mailing_ListID, :Title => Title, :first_name => first_name, :last_name => Last_Name, :Address1 => Address1, :Address2 => Address2, :Address3 => Address3, :Address4 => Address4, :Address5 => Address5, :Postal_Code => Postal_Code, :Home_Phone => Home_Phone, :Work_Phone => Work_Phone, :division_id => Division, :pot_luck => pot_luck, :email => email, :Over_55s => Over_55s,)
     u.save
   end
 end
 
desc "Import Courts." 
 task :import_courts => :environment do
   File.open("courts.csv", "r").each do |line|
     court,lights,name,address,home,mobile = line.strip.split("|")
     u = Court.new(:court => court, :lights => lights, :name => name, :address => address, :home => home, :mobile => mobile,)
     u.save
   end
 end

desc "Clear_Fixtures" 
 task :clear_fixtures => :environment do
     Fixture.delete_all
 end

desc "import divisions."
  task :import_divisions => :environment do
    premier = Division.new(:name => "Premier")
    premier.save
    first = Division.new(:name => "1")
    first.save
    second = Division.new(:name => "2")
    second.save
    third = Division.new(:name => "3")
    third.save
    fourth = Division.new(:name => "4")
    fourth.save
  end
