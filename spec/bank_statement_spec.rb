require 'bank_statement'

describe BankStatement do

  let(:bank_account) {double :bank_account}
  let(:statement) { BankStatement.new(bank_account)}

  describe '#print_statement' do
    before do
      
    end

    it "returns 'date || credit || debit || balance'" do
      expect(statement.print_statement).to include("date || credit || debit || balance")
    end

  end

end