# frozen_string_literal: true
require 'bank_statement'
require 'date'

describe BankStatement do
  
  describe '#print_statement' do
    context 'single transaction' do

      let(:account) { double('account', transactions: [{type: 'credit', amount: '1000.00', date: DateTime.now.strftime('%d/%m/%Y'), balance: '1000.00' }]) }
      let(:statement) { BankStatement.new(account) }

      it "returns 'date || credit || debit || balance'" do
        expect(statement.print_statement).to include('date || credit || debit || balance')
      end

      it 'returns the statement for one deposit of 1000' do
        expect(statement.print_statement).to eq('date || credit || debit || balance\n' + DateTime.now.strftime('%d/%m/%Y') + ' || 1000.00 || || 1000.00')
      end
    
    end

    context 'two transactions recorded on statement in reverse' do
      let(:account2) { double('account', transactions: [ { type: 'credit' , amount: '1000.00', date: DateTime.now.strftime('%d/%m/%Y'), balance: '1000.00' }, {type: 'debit' , amount: '500.00', date: DateTime.now.strftime('%d/%m/%Y'), balance: '500.00' } ] ) }
      let(:statement2) { BankStatement.new(account2)}

      it 'returns the statement for one deposit of 1000 and withdrawal of 500' do
        expect(statement2.print_statement).to eq('date || credit || debit || balance\n' +
                                                  DateTime.now.strftime('%d/%m/%Y') + ' || || 500.00 || 500.00\n' +
                                                  DateTime.now.strftime('%d/%m/%Y') + ' || 1000.00 || || 1000.00'
                                                )
      end
    end
  end
end
