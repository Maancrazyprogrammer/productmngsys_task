# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    # Define abilities for the user here. For example:
    #
      # return unless user.present?
      # can :read, :all
      # return unless user.admin?
      # can :manage, :all
      #

      if user.buyer?
          can :read, Product, buyer_id: user.id
          can :read, Cart,buyer_id: user.id
          cannot :create, Product, buyer_id: user.id
          cannot :new, Product, buyer_id: user.id
          cannot :destroy, Product, buyer_id: user.id
          cannot :update, Product, buyer_id: user.id
          cannot :edit, Product, buyer_id: user.id

          can :create, Cart,buyer_id: user.id
          can :new, Cart,buyer_id: user.id


      elsif user.admin?
        # can :manage, :all, Product, admin_id: user.id
        cannot :read, Product,admin_id: user.id
        can :edit, Product,admin_id: user.id
        can :destroy, Product,admin_id: user.id
        can :new, Product,admin_id: user.id
        cannot :new, Cart,admin_id:user.id
        cannot :create, Cart,admin_id:user.id
        cannot :read, Cart,admin_id:user.id

        end








    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
