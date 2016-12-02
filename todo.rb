# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
 # require 'beybug'
# Your Code begins from this line onwards #


class  Todo < ActiveRecord::Base

 
	def initialize
		@id = id
	 	@description = description
	 	@status = status

		end

	def to_s
 	puts "#{@description}::: #{@status}"
		end

	def self.list
		p Task.all
		end

	def self.find_bro(id)
     task = Task.find_by(:id => id)
		end

	def self.add(description,status)
	task = Task.create(description: description, :status => status)
	end

	def self.delete(id)
    task = Task.delete(:id => id)
   
	end

	def self.edit(id,description, status)
		# task = Task.find(:id => id)
		 task = Task.find(id)
		task.update(description: description, :status => status)
		puts "Has Been Updated"
	end

	


end
	
if __FILE__ == $0

  case ARGV[0]
  when 'list','ls'
     Todo.list

 when 'find','f'
 	puts "Inser the id u looking for: "
 	x = $stdin.gets.chomp.to_i
 	p Todo.find_bro(x)

  when 'add','a'
  	puts "Inser your Description: "
  	a = $stdin.gets.chomp.to_s
  	puts "Insert your status"
  	b = $stdin.gets.chomp.to_s
  	Todo.add(a,b)
  	puts "DONE the data Has been added"

  when 'delete', 'del', 'd'
  	puts "insert the number you want DELETE it :"
  	i = $stdin.gets.chomp.to_i
  	Task.delete(i)
    puts "DONE bro"

  when 'update'
     puts "insert the ID"
     n = $stdin.gets.chomp.to_i
     p Todo.find_bro(n)
     puts "update the description:"
     m = $stdin.gets.chomp.to_s
     
     puts "update the status"
     mm = $stdin.gets.chomp.to_s

     Todo.edit(n,m,mm)
     else
    puts "\ntodo [options] \n\n"
    puts "Commands:"
    puts "  (list)    Lists all active todos"
    puts "  (add)     To Adds a todo"
    puts "  (delete)  To Removes a todo"
    puts "  (find)    To find ur Todo"
    puts "  (update)  To Completes a todo"
       
     end
end

# p Todo.add("kill the bird","undone")
# Todo.list
