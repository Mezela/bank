require 'bank_statement'

describe BankStatement do

  let(:bank_account) {double :bank_account}
  let(:statement) { BankStatement.new(bank_account)}

  describe '#print_statement' do
    before do
      allow(:bank_account).to receive(:deposit)
    end

    

  end

end