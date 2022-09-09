class BookingPolicy < ApplicationPolicy
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

  def update?
    # true <= any user can see it
    # false <= no user can see it
    record.costume.user == user # <= only the owner of the booking can edit it
  end
end
