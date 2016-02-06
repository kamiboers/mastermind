require_relative 'begin'

puts "\n\nWelcome to MASTERMIND\n\n"

verify = false
until verify == true

puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
play = String(gets.chomp).downcase


  if play == "p" || play == "play"
    verify = true
    Play = Begin.new
    Play.computer_input
  elsif play == "i" || play == "instructions"
    verify = false
    puts "\nI don't know what the instructions are.\n"
  elsif play == "q" || play == "quit"
    verify = true
    puts "\nGoodbye\n"
    exit
  else
    verify = false
    puts "\nEntry invalid. Please try again.\n"
  end
end


# !> /Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/event_stream/producer.rb:97:in `record_exception': undefined method `size' for nil:NilClass (NoMethodError)
# !> \tfrom /Users/Kami/.rvm/gems/ruby-2.3.0/gems/seeing_is_believing-3.0.0.beta.6/lib/seeing_is_believing/the_matrix.rb:40:in `block in <top (required)>'
# !> /Users/Kami/turing/1module/practice/newstermind/newstermind.rb: /Users/Kami/turing/1module/practice/newstermind/begin.rb:17: syntax error, unexpected end-of-input, expecting keyword_end (SyntaxError)
