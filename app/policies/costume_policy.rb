class CostumePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == current_user
  end

  def edit?
    record.user == current_user
  end

  def destroy?
    record.user == current_user
  end
end
