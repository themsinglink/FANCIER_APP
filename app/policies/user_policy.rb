class UserPolicy < ApplicationPolicy
  class Scope
    def resolve
      scope.all
    end

    def index
      true
    end

    def show?
      true
    end
  end
end
