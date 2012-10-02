class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
    
    if(user.id==1)
    can :search, Player
    can :create,Player
    can :edit,Player
    can :create,Court
    can :create,Event
    can :edit, Court
    can :edit,Event
    can :create,Fixture
    can :edit,Fixture
    can :edit,Team
    can :create,Team
    can :create,Result
    can :edit,Result
    can :manage,:Members
    end
    can :manage,User do |u|
    	u==user
    end

    unless user.password.nil?
      can :view,:rules
    end 
       
    if user.role? :admin
      can :manage, :all
    elsif user.role? :divisional_admin
      can :manage, [Result]
   
    end
  end
end
