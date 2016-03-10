require 'pry'  # => true

class Begin

  def initialize (timer_string = nil, counter = 0, computer_input = nil, user_input = nil, number_correct = nil, elements_right = nil)
    @computer_input = computer_input                                                                                # => nil
    @user_input = user_input                                                                                        # => nil
    @number_correct = number_correct                                                                                # => nil
    @elements_right = elements_right                                                                                # => nil
    @counter = counter
    @timer_string = timer_string                                                                            # => 0
  end                                                                                                               # => :initialize

  def welcome
    puts "\n\nWelcome to MASTERMIND\n\n"  # => nil
  end                                     # => :welcome

  def want_to_play?

    loop do
      puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"  # => nil
      play = String(gets.chomp).downcase                                   # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      is_it_q(play)

      if play == "p" || play == "play"
        break
      elsif play == "i" || play == "instructions"
        puts "\n\nMASTERMIND has generated a sequence of colors. Your job is to guess the sequence. Each time that you guess, MASTERMIND will tell you how close you are to accuracy.\n\n"
      else
        puts "\nEntry invalid. Please try again.\n"
      end
    end
  end                                                                                                                                                                                       # => :want_to_play

def print_beginner_intro
  puts "\n\nI have generated a beginner sequence with four elements made up of:
  \n(r)ed, (g)reen, (b)lue, and (y)ellow\n
  Use (q)uit at any time to end the game."
end                                       # => :print_beginner_intro

def create_computer_input
  array = ["r", "b", "g", "y"]    # => ["r", "b", "g", "y"]
  letter = ""                     # => ""
  array.count.times do            # => 4
   letter << array.shuffle.first  # => "y", "yr", "yrb", "yrbg"
  end                             # => 4
  @computer_input = letter        # => "yrbg         # => nil
end                               # => :create_computer_input

def is_it_q(guess)
  if guess == "q" || guess == "quit"
    puts "Goodbye"
    exit
  end
end                                   # => :is_it_q

def cheat(guess)
  if guess == "c" || guess == "cheat"
  puts "MASTERMIND's sequence is #{@computer_input}"
end
end

# def valid_play_prompt?
#
# end  # => :valid_play_prompt?
#
# def get_user_input
# end                 # => :get_user_input


def user_prompt
  verify = false
  until verify == true

  puts "\n\nWhat's your guess?"
  guess = String(gets.chomp).downcase.delete(' ')
  verify = guess.delete('rgby').empty? && guess.length == 4
    is_it_q(guess)
    cheat(guess)
    if guess.length != 4
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
#puts "Computer input: \t #{@computer_input}\n\n"

local_user_input = @user_input
local_computer_input = @computer_input
str_length = @user_input.length - 1
correct_array = []

correct_array = (0..str_length).map { |position|
  (local_user_input[position] == local_computer_input[position]).to_s }

num_correct_hash = Hash.new 0

correct_array.each do |truth|
  num_correct_hash[truth] += 1
end
@number_correct = num_correct_hash["true"]
end                                         # => :how_right

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

elements_wrong = 0
comp_each_letter.keys.each do |letter|
  if comp_each_letter[letter]-user_each_letter[letter] >= 0
    elements_wrong += comp_each_letter[letter]-user_each_letter[letter]
  end
end

  @elements_right = @user_input.length - elements_wrong
end                                                      # => :elements_right


def return_results
  puts "\n'#{@user_input.upcase}' has #{@elements_right} of the correct elements with #{@number_correct} in the correct positions"
end                                                                                                                                 # => :return_results


def check_guess
  how_right
  elements_right
end               # => :check_guess

def counter
  @counter += 1

if @counter == 1
  puts "You've taken #{@counter} guess."
else
  puts "You've taken #{@counter} guesses."
end
end                                         # => :counter

def timer_start
     @start_time = Time.now
end

def timer_stop
  stop_time = Time.now - @start_time
  if stop_time >= 60
    stop_time_min = (stop_time/60).to_i
    stop_time_sec = stop_time%60
  else
    stop_time_min = 0
    stop_time_sec = stop_time.to_i
  end
  @timer_string = "#{stop_time_min} minutes, #{stop_time_sec} seconds.\n"
end

def congratulate_user
  timer_stop
  puts "\nCongratulations! You guessed the sequence '#{@computer_input.upcase}' in #{@counter} guesses over " + @timer_string
  loop do
    puts "Do you want to (p)lay again or (q)uit?"
    play = String(gets.chomp).downcase
    is_it_q(play)
    if play == "p" || play == "play"
      play_game
    else
      puts "Invalid entry, please try again."
    end
  end
end  # => :congratulate_user




# end
def play_game
  #Play_game
  welcome               # => nil
  # 1. Generate the mastermind string
  create_computer_input # creates the random string and stores it in an instance variable @computer_input
  # 1.5 Prompt whether to start a game
  want_to_play?
  print_beginner_intro
  # 2. If we start a game
  # 3. Prompt for an input
  timer_start
  loop do
  user_prompt

  # 3.5. add one to counter
  # 4. compare user input with mastermind string
  how_right
  elements_right
  # 5. return analysis of the accuracy of user string
  return_results
  counter
  # 6. if wrong, loop back to #3
  # 7. if right, congratulate and end game
  break if @user_input == @computer_input
  end
  timer_stop
  congratulate_user
    # 8. return to #1.5

    #break if gets.chomp[0] == 'q'                    # => nil

end  # => :play_game

end  # => :play_game


if __FILE__ == $0                                    # => true
  $:.unshift File.join(File.dirname(__FILE__),'..')  # => ["/Users/Kami/turing/1module/practice/newstermind/..", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0@global/gems/did_you_mean-1.0.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/coderay-1.1.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/slop-3.6.0/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/method_source-0.8.2/lib", "/Users/Kami/.rvm/gems/ruby-2.3.0/gems/pry-0.10.3/lib", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby/2.3.0/x86_64-darwin15", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/site_ruby", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin15", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/vendor_ruby", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0", "/Users/Kami/.rvm/rubies/ruby-2.3.0/lib/ruby/2.3.0/x86_64-darwin15"]
doit = Begin.new                                     # => #<Begin:0x007fb1da266db0 @computer_input=nil, @user_input=nil, @number_correct=nil, @elements_right=nil, @counter=0>
doit.play_game
# loop do
# doit.computer_input                                  # => nil
# doit.user_prompt
# doit.how_right
# doit.elements_right
# doit.return_results
# break if gets.chomp[0] == 'q'
# end# doit.compare_strings
end


#doit.play_game

# >>
# >>
# >> Welcome to MASTERMIND
# >>
# >> yrbg
# >> Would you like to (p)lay, read the (i)nstructions or (q)uit?

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
# ~> /Users/Kami/turing/1module/practice/newstermind/mastermind.rb:22:in `want_to_play'
# ~> /Users/Kami/turing/1module/practice/newstermind/mastermind.rb:177:in `play_game'
# ~> /Users/Kami/turing/1module/practice/newstermind/mastermind.rb:208:in `<main>'
