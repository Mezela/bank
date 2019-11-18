require 'bank_statement'
require 'bank_account'
require 'date'

describe BankStatement do

  let(:bank_account) {double :bank_account }
  let(:statement) { BankStatement.new(bank_account)}

  describe '#print_statement' do

    it "returns 'date || credit || debit || balance'" do
      account2 = BankAccount.new
        account2.deposit(1000)
        statement2 = BankStatement.new(account2)
      expect(statement2.print_statement).to include("date || credit || debit || balance")
    end

    context 'one deposit of 1000' do
      it "returns the statement for 2 transactions" do
        # allow(bank_account).to receive(:deposit).with(1000)
        account2 = BankAccount.new
        account2.deposit(1000)
        statement2 = BankStatement.new(account2)
        expect(statement2.print_statement).to eq("date || credit || debit || balance\n" + DateTime.now.strftime("%d/%m/%Y") +" || 1000.00 || || 1000.00")
        # bank_account.deposit(1000)
        # expect(statement.print_statement).to eq("date || credit || debit || balance\n" + DateTime.now.strftime("%d/%m/%Y") +" || 500.00 || 1000.00")
      end
    end
  end

end