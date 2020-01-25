require 'date'
# お客さんをモデリングしたクラス
class User
  attr_accessor :name, :password, :age, :birth_month, :tickets

  def initialize(name:,password:,age:,birth_month:,tickets: [])
    @name        = name
    @password    = password
    @age         = age
    @birth_month = birth_month
    @tickets     = tickets
  end
end

# 券売機をモデリングしたクラス
class TicketVendingSystem
  attr_accessor :users, :rides, :current_user

  def initialize(rides: [])
    @users        = []
    @rides        = []
    @current_user = nil
  end

  def show_first_message
    puts "遊園地へようこそ！初めてのご利用ですか？Y/N"
    input = gets.chomp.upcase
    # if input ==  "Y"
    if /^Y$/ =~ input
        self.user_registration
    else 
        puts "login"
    end
  end

  def user_registration
    puts "ユーザー登録を行います"
    puts "ユーザー名を入力してください"
    name = gets.chomp
    puts "パスワードを入力してください"
    password = gets.chomp
    puts "年齢を入力してください"
    age = gets.chomp.to_i
    puts "誕生月を入力してください"
    birth_month = gets.chomp.to_i
    new_user = User.new(name: name, password: password, age: age, birth_month: birth_month)
    @users << new_user
  end    
end

# アトラクションをモデリングしたクラス
class Ride
  attr_accessor :name, :age_limit, :fee, :status 

  def initialize(name:, age_limit:, fee:, status:) 
    @name      = name
    @age_limit = age_limit
    @fee       = fee
    @status    = status
  end
end

# チケットをモデリングしたクラス
class Ticket
  attr_accessor :user,  :ride, :created_at, :fee

  def initialize(user:, ride:, created_at:, fee:)
    @user       = user
    @ride       = ride
    @created_at = Date.today
    @fee        = ride.fee
  end
end

ticket_vending_system = TicketVendingSystem.new
ticket_vending_system.show_first_message