class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.general?
  end

  def show?
    user.admin? || user.general?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
