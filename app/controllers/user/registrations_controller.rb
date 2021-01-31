class User::RegistrationsController < Devise::RegistrationsController
  after_action :create_tenant, only: [:create]
  after_action :destroy_tenant, only: [:destroy]

  def create
    super
  end

  def create_tenant
    Apartment::Tenant.create(@user.email)
  end

  def destroy_tenant
    Apartment::Tenant.drop(@user.email)
  end

end
