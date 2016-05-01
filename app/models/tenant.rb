class Tenant < ActiveRecord::Base
  enum marital_status: { single: 0, married: 1, divorced: 2 }
  enum gender: { male: 0, female: 1 }

  belongs_to :user

  has_many :rentals
  has_many :apartments, through: :rentals
  has_one :testimonial

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
