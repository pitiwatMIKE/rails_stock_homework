# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.has_role? :admin
        can :manage, :all
      else
        #none role
        can [:read, :search], Product, user: user
        can [:create, :update], Product
      end
    end
  end
end
