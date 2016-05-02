module RentalInvoicesHelper
  def status_button(rental_invoice)
    html_classes = "label label-"

    if rental_invoice.paid?
      html_classes += "success"
      label = "Paid"
    elsif rental_invoice.invoice_date < Date.today
      label = "Overdue"
      html_classes += "danger"
    else
      label = "DUE Soon"
      html_classes += "warning"
    end

      button = "<span class='#{html_classes}'>#{label}</span>"
  end

  def status_row_class(rental_invoice)
    html_classes = ""

    if rental_invoice.paid?
      html_classes += "success"
    elsif rental_invoice.invoice_date < Date.today
      html_classes += "danger"
    else
      html_classes += "warning"
    end
  end

  def status_text(rental_invoice)
    if rental_invoice.paid?
      ""
    elsif rental_invoice.invoice_date < Date.today
      "Overdue"
    else
      "Due Soon"
    end
  end

  def rental_invoice_action_text(rental_invoice)
    if rental_invoice.paid?
      "View Receipt"
    else
      "Pay Invoice"
    end
  end

  def rental_invoice_action(rental_invoice)
    if rental_invoice.paid?
      "Payment Record"
    else
      "Pay Invoice"
    end
  end

  def display_rental_status(rental_invoice)
    "#{rental_invoice.status.titlecase} #{status_text(rental_invoice)}"
  end
end
