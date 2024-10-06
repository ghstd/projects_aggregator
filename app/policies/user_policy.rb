class UserPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def create?
    user.blank?
  end

  def show?
    user.admin?
  end

  def update?
    user == record
  end

  def destroy?
    user == record || user.admin?
  end
end
