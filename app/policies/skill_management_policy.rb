class SkillManagementPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || user.general?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.general?
  end

  def edit?
    update?
    user.admin? || user.general?
  end

  def destroy?
    true
  end
end
