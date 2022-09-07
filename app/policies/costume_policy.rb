class CostumePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true # <= any user can see it
    # false <= no user can see it
    # record.user == current_user <= only the owner of the costume can see it
  end
end
