# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  def create?
    check_admin
  end

  def new?
    create?
  end

  def update?
    check_admin
  end

  def edit?
    update?
  end

  def destroy?
    check_admin
  end

  private

  def check_admin
    raise Pundit::NotAuthorizedError unless @user.admin?

    @user.admin?
  end
end
