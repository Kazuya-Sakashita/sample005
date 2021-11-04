# userpolicy.rbを下記の内容にて新規に作成
# 基本的に全ての機能を許可。
# ただしユーザー詳細は管理ユーザーのみ許可
class UserPolicy < ApplicationPolicy
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
    user.admin?
  end

  def edit?
    update?
    user.admin? || user.general?

  end

  def destroy?
    true
  end
end
