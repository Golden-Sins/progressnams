def send_contact_email
    contact = Contact.find(params[:id]) # Fetch the contact record or retrieve it in some other way
    ContactMailer.send_email(contact).deliver_now
  end