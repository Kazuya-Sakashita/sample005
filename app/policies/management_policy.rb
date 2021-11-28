class ManagementPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || user.general?
  end

  def create?
    user.admin? || user.general?
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
