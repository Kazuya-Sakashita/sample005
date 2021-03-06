class WagePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || user.general?
  end

  def create?
    user.admin?
  end

  def new?
    create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
    user.admin?
  end

  def destroy?
    true
  end
end
