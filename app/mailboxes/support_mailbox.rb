class SupportMailbox < ApplicationMailbox
  def process
    puts "START SupportMailbox#process:"
    puts "From   : #{mail.from[0]}"
    puts "Subject: #{mail.subject}"
    puts "Body   : #{mail.body}"
    puts "END SupportMailbox#process:"
    recent_order = Order.where(email: mail.from[0]).order('created_at desc').first
    SupportRequest.create!(
      email: mail.from[0],
      subject: mail.subject,
      body: mail.body,
      order: recent_order
    )
  end
end
