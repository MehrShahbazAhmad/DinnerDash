# frozen_string_literal: true

class CategoryPolicy < ApplicationPolicy
  def index?
    check_user
  end

  def show?
    check_user
  end

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

  def check_user
    raise Pundit::NotAuthorizedError unless @user

    @user
  end
end
