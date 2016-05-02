class RentalInvoice < ActiveRecord::Base
  enum card_type: { visa: 0, master_card: 1, discover: 2}
  belongs_to :rental
  before_save :validate_payment
  before_save :set_default_dates
  scope :paid, -> { where(is_paid: true) }
  scope :unpaid, -> { where("is_paid is NULL or false") }
  scope :on_month, -> (month) { where( 'extract(month from invoice_date) = ?', month) }
  scope :on_year, -> (year) { where( 'extract(year from invoice_date) = ?', year) }

  def paid?
    if self.is_paid.nil? || self.is_paid == false
      return false
    else
      return true
    end
  end

  def status
    paid? ? "paid" : "unpaid"
  end
  private
  def validate_payment
    if self.cc_amount_charged == self.amount
      self.is_paid = true
    end
  end

  def set_default_dates
    self.invoice_date = Date.today unless !self.invoice_date.nil?
    true
  end

end
