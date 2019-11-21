# Bank Tech Test

This program interacts with the command line, taking an input of a deposit or withdrawal and returning the account statement. 
The account statement consists of the date, amount and balance.

### Approach

First, developed the user stories from the list of requirements given and the acceptance criteria. After this, I noted down what the inputs and user outputs would be.

I then built two classes: one to print the bank statement for any account and another class to record the transactions made in an account. This approach was initially used to stick to the single responsibility principle, but I then found that the bank account class had two responsibilities: dealing with updating the account after deposits/withdrawals and recording the transaction. Therefore I created a third class, BankTransactions, to deal with recording each individual transaction.

The hard dependencies between the classes was removed using dependency injection.

### Next steps
- Add additional class for recording transactions
- Classes <30 lines ; methods <5 lines

## Install
First, clone this repository. Then move into the folder:
```
$ cd path/to/bank/repo
$ bundle install
```

Ensure Ruby is installed (using either RVM or RubyInstaller).

## Run the app
```
$ irb
$ require './lib/bank_statement.rb'
```
## Run the tests
```
$ cd path/to/bank/repo
$ rspec
```
## Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
![Screenshot of running app](https://github.com/Mezela/bank/blob/master/img/bank_acceptance_criteria_screenshot.png "Screenshot of the app running")

## User stories
```
As a user
So that I can save my money,
I would like to make a deposit to my bank account.
```

```
As a user
So that I can spend my money,
I would like to make a withdrawal to my bank account.
```

```
As a user
So that I can decide keep track of my account usage,
I would like to be able to see my latest bank statement including date, type (credit or debit) and amount for each transaction and the balance after the transaction is complete (in reverse order by date).
```

```
As a user
So that I can decide keep track of my account usage,
I would like to be able to see my latest bank transactions printed in reverse chronological order.
```

### Edge cases
```
As a user
So that I don't spend more than I have
I would like to receive a message when I have insufficient balance
```
i.e.
```
Given a client makes a deposit of 1000
And tries to make a withdrawal of 1001
She will receive an error message 
And when she prints her bank statement
Then she would see

date || credit || debit || balance
10/01/2012 || 1000.00 || || 1000.00
```

## Technologies used
- Ruby 
- Rspec
- Simplecov
- Rubocop

