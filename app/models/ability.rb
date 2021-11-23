# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.has_role? :admin
        # admin
        can :manage, :all
      elsif user.has_role? :modulator
        # modulator
        can [:read, :create, :update, :search], Product
        can [:read, :create, :update, :destroy], User, id: user.id
      elsif user.has_role? :anonymous
        # anonymous
        cannot :manage, :all
      else
        # none role
        can [:read, :create, :update, :search], Product, user_id: user.id
        can [:read, :create, :update, :destroy], User, id: user.id
      end
    end
  end
end
