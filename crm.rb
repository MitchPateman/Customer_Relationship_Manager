require_relative "contact"


class CRM
attr_accessor :name

#@@contact_list = Contact.all



	def initialize(name)
		@name = name
	end


	def main_menu
		while true # repeat indefinitely
			print_main_menu
			user_selected = gets.to_i
			call_option(user_selected)
		end
	end


	def print_main_menu
		puts '[1] Add a new contact'
		puts '[2] Modify an existing contact'
		puts '[3] Delete a contact'
		puts '[4] Display all the contacts'
		puts '[5] Search by attribute'
		puts '[6] Exit'
		puts 'Enter a number: '
	end


	def call_option(user_selected)
		case user_selected
			when 1 then add_new_contact
			when 2 then modify_existing_contact
			when 3 then delete_contact
			when 4 then display_all_contacts
			when 5 then search_by_attribute
			when 6 then exit
		end
	end


	def add_new_contact
		print 'Enter First Name: '
		first_name = gets.chomp

		print 'Enter Last Name: '
		last_name = gets.chomp

		print 'Enter Email Address: '
		email = gets.chomp

		print 'Enter a Note: '
		note = gets.chomp

		new_contact = Contact.create(first_name, last_name, email, note)
		puts "New Contact: #{new_contact.first_name} #{new_contact.last_name}, ID: #{new_contact.id}"
		new_contact
	end


	def modify_existing_contact
		puts "Enter the ID of the contact you want to change"
		id = gets.chomp.to_i
		puts " First Name: #{(Contact.find(id)).first_name}"
		puts " Last Name: #{(Contact.find(id)).last_name}"
		puts " Email: #{(Contact.find(id)).email}"
		puts " Note: #{(Contact.find(id)).note}"

		puts "What attribute do you want to update for this contact?"
		puts "first_name, last_name, email, note"
		attribute = gets.chomp

		puts "Enter new value for #{attribute} on Contact #{id}"
		new_value = gets.chomp
		(Contact.find(id)).update(attribute, new_value)

		change = Contact.find(id)
		change.update(attribute, new_value)
		 puts " First Name: #{(Contact.find(id)).first_name}"
		 puts " Last Name: #{(Contact.find(id)).last_name}"
		 puts " Email: #{(Contact.find(id)).email}"
		 puts " Note: #{(Contact.find(id)).note}"
	end



	def delete_contact
		puts "Which contact to delete by ID value???"
		delete_id = gets.chomp.to_i
		del_user = Contact.find(delete_id)
		del_user.delete
	end


	# This method should accept as an argument an array of contacts
	# and display each contact in that array
	def display_contacts(contacts)
		contacts.each do |contact|
			puts"#{contact.first_name} #{contact.last_name} : #{contact.email}  -->  #{contact.note}"
		end
		# HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
	end

	def display_all_contacts
			display_contacts(Contact.all)
		# HINT: Make use of the display_contacts method to keep your code DRY
	end

	def search_by_attribute
			puts "What attribute do you want to search?"
			find_attribute = gets.chomp
			puts "Enter the value you want to search for: "
			value = gets.chomp

			display_contacts(Contact.find_by(find_attribute, value))

		# HINT: Make use of the display_contacts method to keep your code DRY
	end

	# Add other methods here, if you need them.

end

crm = CRM.new("Mitch")
crm.main_menu
