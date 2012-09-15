class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
    
    can :manage,User do |u|
    	u==user
    end
    if user.role? :admin
      can :manage, :all
    elsif user.role? :divisional_admin
      can :manage, [Result]
   
    end
  end
end
