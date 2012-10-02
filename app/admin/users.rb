ActiveAdmin.register User do
menu :priority => 1, :label => "Users"

  filter :email
  filter :username
  filter :role ,:collection => proc { Role.all }
  

  filter :current_sign_in_at
  filter :last_sign_in_at
  
index do
  column :id
  column :email
  column :username
  column "Roles" do |user|
      @roles=String.new
      user.roles.each do |role|
        @roles=@roles+role+"\n"
      end
      if @roles.empty? then
        "Not Assigned"
    else
      @roles
    end
    end
  

  column :current_sign_in_at
  column :last_sign_in_at
  column :current_sign_in_ip
  column :last_sign_in_ip
  default_actions   
end

form do |f|
      f.inputs "Basic Login Info" do
        f.input :email
        f.input :password
        f.input :password_confirmation , :label=>"Confirm Password"
      end
      f.inputs "Advanced" do
        f.input :username
        f.input :roles
      end
      f.buttons
    end


end
