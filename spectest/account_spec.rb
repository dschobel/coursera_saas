require './account.rb'

describe Account, "#balance" do
    it "should start at 0" do
        account = Account.new
        account.balance.should eq(0)
    end
end
