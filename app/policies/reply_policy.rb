class ReplyPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user || user.admin?
  end

end
