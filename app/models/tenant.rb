class Tenant < ActiveRecord::Base
  enum marital_status: { single: 0, married: 1, divorced: 2 }
  enum gender: { male: 0, female: 1 }

  has_one :user
  has_many :rentals
  has_many :apartments, through: :rentals
  has_many :complaints, as: :complaintable
end
