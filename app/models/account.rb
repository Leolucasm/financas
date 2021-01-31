class Account < ApplicationRecord
  acts_as_tenant(:user)
  validates_presence_of :description
end
