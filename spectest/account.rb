class Account

    def initialize(start_balance = 0)
        @balance = start_balance
    end

    attr_accessor :balance

    def deposit(amount)
        @balance += amount
    end

    @@bank_name = "Bank of America"

    def self.bank_name
        @@bank_name
    end
end
