# Bank Tech Test

This program interacts with the command line, taking an input of a deposit or withdrawal and returning the account statement. 
The account statement consists of the date, amount and balance.

## Install
First, clone this repository. Then move into the folder
$ cd path/to/bank/repo

Ensure IRB is installed [add to this]


## Run the app

$ irb
$ require './bank_account.rb'
$ require './bank_statement.rb'


## Run the tests

$ cd path/to/count/repo
$ rspec

## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).


## User stories
User Story 1:
```
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Edge cases
User Story 2:
```
Given a client makes a deposit of 1000
And tries to make a withdrawal of 1001
She will receive an error message 
And when she prints her bank statement
Then she would see

date || credit || debit || balance
10/01/2012 || 1000.00 || || 1000.00
```
