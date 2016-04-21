class Testimonial < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :tenant
end
