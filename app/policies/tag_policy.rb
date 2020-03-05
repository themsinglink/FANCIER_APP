class TagPolicy < ApplicationPolicy
  class Scope
    def resolve
      scope.all
    end

    def show?
      true
    end
  end
end
