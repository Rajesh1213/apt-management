class Testimonial < ActiveRecord::Base
  validates :content, presence: true
  validates :date_entered, presence: true

  belongs_to :tenant
end
