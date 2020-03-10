class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def toggle
      true
    end

    def destroy?
      record.user == user
    end
  end
end
