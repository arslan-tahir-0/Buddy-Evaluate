# frozen_string_literal: true

# Blog App
class BlogPolicy < ApplicationPolicy
  # Blog App
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Accesible to all except the Admin
    !@user.Admin?
  end

  def show?
    !@user.Admin?
  end

  def create?
    @user.User?
  end

  def new?
    create?
  end

  def update?
    !@user.Admin?
  end

  def edit?
    update?
  end

  def destroy?
    !@user.Admin?
  end
end
