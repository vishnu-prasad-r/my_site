class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
    
    can :search, Player
    can :create,Player
    can :create,Court
    can :create,Event
    
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
