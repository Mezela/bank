# Bank Tech Test

This program interacts with the command line, taking an input of a deposit or withdrawal and returning the account statement. 
The account statement consists of the date, amount and balance.

## Install
First, clone this repository. Then move into the folder:
$ cd path/to/bank/repo
$ bundle install

Ensure Ruby is installed (using either RVM or RubyInstaller).

## Run the app

$ irb
$ require './lib/bank_statement.rb'

## Run the tests

$ cd path/to/bank/repo
$ rspec

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

## User stories
```
As a user
So that I can save my money,
I would like to make a deposit to my bank account
```

```
As a user
So that I can spend my money,
I would like to make a withdrawal to my bank account
```

```
As a user
So that I can decide keep track of my account usage,
I would like to be able to see my latest bank statement including date, type and amount of transaction and balance (in reverse order by date)
```

### Edge cases
```
As a user
SO that I don't spend more than I have
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

## Technologies
- Ruby 
- Rspec
- Simplecov
- Rubocop