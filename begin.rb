require 'pry'  # => true

class Begin
attr_reader :random_string, :computer_input, :user_prompt # => nil

def initialize (counter = 0, computer_input = nil, user_input = nil, random_string = nil, number_correct = nil, elements_right = nil)
  @computer_input = computer_input                                            # => nil, nil
  @user_input = user_input                                                    # => nil, nil
  @random_string = random_string
  @number_correct = number_correct
  @elements_right = elements_right
  @counter = counter                                    # => nil, nil
end                                                                           # => :initialize

def random_string
  array = ["r", "b", "g", "y"]    # => ["r", "b", "g", "y"]
  letter = ""                     # => ""
  array.count.times do            # => 4
   letter << array.shuffle.first  # => "r", "ry", "ryr", "ryrg"
  end                             # => 4
  letter                          # => "ryrg"
end                               # => :random_string

def computer_input
  thing = Begin.new                      # => #<Begin:0x007fa78ba17d88 @computer_input=nil, @user_input=nil, @random_string=nil>
  @computer_input = thing.random_string  # => "ryrg"
  puts @computer_input                   # => nil
end                                      # => :computer_input

def user_prompt
  puts "\n\nI have generated a beginner sequence with four elements made up of: \n\n(r)ed, (g)reen, (b)lue, and (y)ellow \n\nUse (q)uit at any time to end the game."  # => nil

  verify = false        # => false
  until verify == true  # => false

  puts "\n\nWhat's your guess?"                                                      # => nil
  guess = String(gets.chomp).downcase.delete(' ')                                    # ~> NoMethodError: undefined method `chomp' for nil:NilClass
  verify = guess.delete('rgby').empty? && guess.length == 4
    if guess == "q"
      puts "Goodbye"
      exit
    elsif guess.length != 4
      puts "Four characters are required. Please try again:"
    elsif !guess.delete('rgby').empty?
      puts "Sorry, only r, g, b and y are acceptable as guesses. Please try again:"

    else
      @user_input = guess
      verify = true
      break
    end

  end
end    # => :user_prompt

def how_right
puts "\n\nUser input: \t\t #{@user_input}"
puts "Computer input: \t #{@computer_input}\n\n"

local_user_input = @user_input
local_computer_input = @computer_input
str_length = @user_input.length - 1
correct_array = []

correct_array = (0..str_length).map { |position|
  puts local_user_input[position]
  puts local_computer_input[position]
  (local_user_input[position] == local_computer_input[position]).to_s }
puts correct_array

num_correct_hash = Hash.new 0

correct_array.each do |truth|
  num_correct_hash[truth] += 1
end

puts num_correct_hash
@number_correct = num_correct_hash["true"]
end  # => :how_right

def elements_right
local_user_input = @user_input.split("")
local_computer_input = @computer_input.split("")

user_each_letter = Hash.new 0

local_user_input.each do |character|
  user_each_letter[character] += 1
end


comp_each_letter = Hash.new 0

local_computer_input.each do |character|
  comp_each_letter[character] += 1
end

puts "User: #{user_each_letter}"
puts "Computer: #{comp_each_letter}"

elements_wrong = 0
comp_each_letter.keys.each do |letter|
  if comp_each_letter[letter]-user_each_letter[letter] >= 0
    elements_wrong += comp_each_letter[letter]-user_each_letter[letter]
  end
end
  
puts elements_wrong
  @elements_right = @user_input.length - elements_wrong
end


def return_results
  puts "'#{@user_input.upcase}' has #{@elements_right} of the correct elements with #{@number_correct} in the correct positions"
end

def counter
@counter += 1
if counter == 1
  puts "You've taken #{@counter} guess."
else
  puts "You've taken #{@counter} guesses."
end

end


end



if __FILE__ == $0                                    # => true
  $:.unshift File.join(File.dirname(__FILE__),'..')  # => ["/Users/Kami/turing/1module/practice/newstermind/..", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0@global/gems/did_you_mean-1.0.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/coderay-1.1.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/slop-3.6.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/method_source-0.8.2/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/pry-0.10.3/lib", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby/2.3.0/x86_64-darwin15", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin15", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/x86_64-darwin15"]
doit = Begin.new                                     # => #<Begin:0x007fa78c0a4a70 @computer_input=nil, @user_input=nil, @random_string=nil>
doit.computer_input                                  # => nil
doit.user_prompt
doit.how_right
doit.elements_right
doit.return_results
# doit.compare_strings
end

# >> ryrg
# >>
# >>
# >> I have generated a beginner sequence with four elements made up of:
# >>
# >> (r)ed, (g)reen, (b)lue, and (y)ellow
# >>
# >> Use (q)uit at any time to end the game.
# >>
# >>
# >> What's your guess?

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/Kami/turing/1module/practice/newstermind/begin.rb:34:in `user_prompt'
# ~> /Users/Kami/turing/1module/practice/newstermind/begin.rb:102:in `<main>'
