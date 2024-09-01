
class ContactsController < ApplicationController
  
  def first_contact
    contact = Contact.first
    render json: { 
      first_name: contact.first_name,
      last_name: contact.last_name,
      email: contact.email,
      phone_number: contact.phone_number
    }
  end

  def all_contacts
    contacts = []
    Contact.all.each { |contact|
      contacts << {
        first_name: contact.first_name,
        last_name: contact.last_name,
        email: contact.email,
        phone_number: contact.phone_number
      }
    }
    render json: {
      contacts: contacts
    }
  end

  def to_terminal
    require 'net/http'
    url = "http://localhost:3000/all_contacts"
    response = HTTP.get(url)
    puts "Status Code: #{response.status}"
    puts "Response Body: #{response.to_s}"
    render json: {
      action: "output written to terminal"
    }
  end
end
