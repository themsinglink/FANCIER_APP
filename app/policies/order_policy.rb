class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user_is_buyer? || user_is_seller?
  end

  private

  def user_is_buyer?
    record.user == user && record.state == "shipped"
  end

  def user_is_seller?
   record.article.user == user && record.state == "paid"
  end
end
