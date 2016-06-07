require 'pry'
require 'minitest/pride'
class Contact
attr_reader :id
attr_accessor :first_name, :last_name, :email, :note

@@contacts = []
@@id = 1
	# This method should initialize the contact's attributes
	def initialize(first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
		@id = @@id
		@@id += 1
	end

	# This method should call the initializer,
	# store the newly created contact, and then return it
	def self.create(first_name, last_name, email, note = "")
		new_contact = Contact.new(first_name, last_name, email, note)
		@@contacts << new_contact
		return new_contact
	end

	# This method should return all of the existing contacts
	def self.all
		@@contacts
	end

##########Trying for display_contacts
	# def self.all_type(find_attribute)
	# 	@@contacts each {|x| return contacts if @@contacts[x][find_attribute] == true}
	# end

	# This method should accept an id as an argument
	# and return the contact who has that id
	def self.find(find_id)
		 @@contacts.each do |contact|
			 if contact.id == find_id
						return contact
			 end
		 end
	end

	# This method should allow you to specify
	# 1. which of the contact's attributes you want to update
	# 2. the new value for that attribute
	# and then make the appropriate change to the contact
	def update(attribute, new_value)
			case attribute
			when "first_name"
				@first_name = new_value
			when "last_name"
				@last_name = new_value
			when "email"
				@email = new_value
			when "note"
				@note = new_value
			end
	end


	# This method should work similarly to the find method above
	# but it should allow you to search for a contact using attributes other than id
	# by specifying both the name of the attribute and the value
	# eg. searching for 'first_name', 'Betty' should return the first contact named Betty
	def self.find_by(find_attribute, value)
		contact_array = []

		case find_attribute
			when "first_name"
				# puts "Which first name are you looking for?"
				# find_first = gets.chomp.to_s
				@@contacts.each do |person|
					if person.first_name == value
						contact_array << person
					end
				end
			when "last_name"
				# puts "Which last name?"
				# find_last = gets.chomp.to_s
				@@contacts.each do |person|
					if person.last_name == value
						contact_array << person
					end
				end
			when "email"
				# puts "Which Email?"
				# find_email = gets.chomp.to_s
				@@contacts.each do |person|
					if person.email == value
						contact_array << person
					end
				end
			when "note"
				# puts "Which Note?"
				# find_note = gets.chomp.to_s
				@@contacts.each do |person|
					if person.note == value
						contact_array << person
					end
				end
			else
				puts "ERROR ERROR ERROR"
		end
		return contact_array[0]
	end


	# This method should delete all of the contacts
	def self.delete_all
		@@contacts.clear
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end

	# This method should delete the contact
	# HINT: Check the Array class docs for built-in methods that might be useful here
	def delete
		#@@contacts -= [delete_id.to_i]
		@@contacts.delete(self)
	end

	# Feel free to add other methods here, if you need them.

end #END OF CONTACT CLASS

# mitch=Contact.create("m","m","m","m")
# puts Contact.find_by('first_name','m')


### TESTING INPUT / OUTPUT ###

# mitch = Contact.create("Mitch", "Pateman", "mitch_pateman@hotmail.com", "This is my contact info")
# lanta = Contact.create("Lanta", "Pateman", "rabbit@gmail.com", "This is my rabbit's email")
#
# # print Contact.all
# # puts Contact.find(2)
# # mitch.update
# # print Contact.all
# Contact.find_by
# print Contact.all
