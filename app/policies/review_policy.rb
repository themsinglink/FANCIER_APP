class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def new?
    create?
  end

  def create?
    user_is_buyer? && order_delivered?
  end

  private

  def order_delivered?
    record.order.state == "delivered"
  end

  def user_is_buyer?
    record.order.user == user
  end
end

