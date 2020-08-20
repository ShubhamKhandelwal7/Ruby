class User
  @@count = 0
  attr_accessor :name, :balance, :account_no

  def initialize(user_details)
    @@count += 1
    @name = user_details.split(':')[0]
    @balance = user_details.split(':')[1].to_f
    @account_no = @@count
  end

  def to_s
    "Account number: #{account_no}\nAccount holder name: #{name}\nAccount balance: #{balance}"
  end

  def transfer(user, amount)
    if user.can_withdraw?(amount)
      user.withdraw(amount)
      deposit(amount)
    end
  end

  def can_withdraw?(amount)
    (@balance >= amount)
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  user1 = User.new(ARGV[0])
  user2 = User.new(ARGV[1])
  user2.transfer(user1, ARGV[2].split(':')[1].to_f)
  puts user1, '', user2
end
