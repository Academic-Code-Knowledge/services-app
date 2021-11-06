class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.operator?
      can :read, User
      #can :write Operation
      #can :update, Operation do |item|
        #item.try(:user) == user
      #end
    else
      #can :read, Order
      #can :read, Operation
    end
  end
end
