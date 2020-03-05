class ArticlePolicy < ApplicationPolicy
  class Scope
    def resolve
      scope.all
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
      (record.user == user) || user.admin
    end

    def update?
     edit?
    end

    def destroy?
      record.user == user
    end
  end
end



