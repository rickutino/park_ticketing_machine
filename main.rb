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