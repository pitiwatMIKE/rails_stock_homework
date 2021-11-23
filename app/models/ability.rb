# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.has_role? :admin
        can :manage, :all
      else
        can :read, Product, user: user
        # can :search, Product, user: user
      end
    end
  end

end
