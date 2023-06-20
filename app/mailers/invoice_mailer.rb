class InvoiceMailer < ApplicationMailer
    default from: 'valtersupenieks35@gmail.com'
      
    def send_email(contact)
        @contact = contact
        mail(to: 'valtersupenieks35@gmail.com', subject: 'New Contact')
    end
end
