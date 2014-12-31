module Spree
  class ShipmentMailer < BaseMailer
    helper 'spree/base'

    def shipped_email(shipment, resend=false)
      @shipment = shipment
      subject = (resend ? "[#{t(:resend).upcase}] " : "")
      subject += "#{Spree::Config[:site_name]} #{t('shipment_mailer.shipped_email.subject')} ##{shipment.order.number}"
      mail(:to => shipment.order.email,
           :subject => subject,
           :from => from_address)
    end
  end
end
