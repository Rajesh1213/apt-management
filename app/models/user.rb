class User < ActiveRecord::Base
  belongs_to :role
  has_one :staff
  has_one :tenant

  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_required?
   false
  end

  def email_changed?
   false
  end

  # Callback to overwrite if confirmation is required or not.
  def confirmation_required?
    !confirmed?
  end
  
  private

  def set_default_role
    self.role ||= Role.find_by_name('tenant')
  end


end
