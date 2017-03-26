#  Created by: Michelle S. Lunoza
#  Course : BSCS


cmd = ""
puts "***Welcome to ATM Simulator***\n\n"
# Check if balance.txt is NULL
file_content = File.read('balance.txt');
# Withdrawal Counter for limit
withdraw_count = 0
if file_content.to_f == 0
  File.write("balance.txt",100)
end

while cmd != "Quit" do
  puts "Would you like to Deposit,Withdraw,check Balance or Quit."
  cmd = gets.chomp

  # Convert input to upper case  for validation
  case cmd.upcase
	  when "WITHDRAW"
      # Read File content
      # .to_f  conver string to number to avoid error

      if withdraw_count <= 9
        file_content = File.read('balance.txt');
        puts "How much would you like to withdraw?"
        amount = gets.chomp
        if amount.to_f <= 50000
          if amount.to_f > 0 && amount.to_f <= file_content.to_f
              current_balance = file_content.to_f - amount.to_f
              File.write('balance.txt',current_balance)
              puts "Your balance is $%.2f\n" % current_balance
              withdraw_count = withdraw_count + 1
          else
              puts "Insufficient Balance"
          end
        else
          puts "Withdrawal limit is $50,000.00"
        end
      else
        puts "You have reached 10 withdrawal limit per day "
      end

	  when "DEPOSIT"
      # Read File content
      # .to_f  conver string to number to avoid error

      file_content = File.read('balance.txt');
	    puts "How much would you like to deposit?"
	    amount = gets.chomp
      if amount.to_f > 0
          if amount.to_f <= 50000
            current_balance = file_content.to_f + amount.to_f
            File.write('balance.txt',current_balance)
            puts "Your balance is $%.2f\n" % current_balance
          else
            puts "Deposit limit is $50,000.00"
          end
      else
        puts "Your deposit amount must be above 0"
      end

	  when "BALANCE"
      # Read File content
      # .to_f  conver string to number to avoid error
      file_content = File.read('balance.txt');
	    puts "Your balance is $%.2f\n" % file_content
    when "QUIT"
      exit
	  else
	    puts "Didn't understand your command. Try again." unless cmd == "Quit"
  end
end
