class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record == user
  end
end
