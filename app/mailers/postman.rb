class Postman < ActionMailer::Base
  default from: "from@example.com"
  def sendcontactsheet(player,xls)
    @player=player
    attachments['contactsheet.pdf'] = {:mime_type => "application/vnd.ms-excel",:content => xls }
    
    mail(:to => "#{@player.name} <#{@player.email}>", :sub=>"Updated contacts sheet")
    puts "mail sent to #{@player.email}"
  end
  
  def encode_with coder # this empty method is used to get rid of an error in delayed_jobs gem
  end
end
