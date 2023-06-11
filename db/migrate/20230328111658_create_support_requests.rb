class CreateSupportRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :support_requests do |t|
      t.string :email, comment: "Email address of the submitter"
      t.string :subject, comment: "Subject of their support request"
      t.text :body, comment: "Body of their support request"
      t.references :order, foreign_key: true, comment: "Their most recent order, if applicable"

      t.timestamps
    end
  end
end
