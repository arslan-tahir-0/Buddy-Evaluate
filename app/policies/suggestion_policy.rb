class SuggestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Accesible to User
    @user.User?
  end

  def show?
    !@user.Moderator?
  end

  def create?
    @user.User?
  end

  def new?
    create?
  end

  def update?
    !@user.Moderator?
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
