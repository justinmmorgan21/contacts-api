
class ContactsController < ApplicationController
  
  def first_contact
    @contact = Contact.first
    render template: "contacts/show"
  end

  def all_contacts
    @contacts = Contact.all
    render template: "contacts/index"
  end

  def to_terminal
    require 'net/http'
    url = "http://localhost:3000/all_contacts.json"
    response = HTTP.get(url)
    puts "Status Code: #{response.status}"
    puts "Response Body: #{response.to_s}"
    render json: {
      action: "output written to terminal"
    }
  end
end
