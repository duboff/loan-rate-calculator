#!/usr/bin/env ruby

require './lib/calculator'
require './lib/csv_processor'

processor = CSVProcessor.new
calc = Calculator.new

processor.path = ARGV.first


calc.lender_proposals = processor.output

calc.initial_amount = ARGV.last.to_i

def output(calculator)
  calculator.get_rate
  raise 'Rates cannot be negative' if calculator.rate < 0
  puts "Requested amount: £#{calculator.initial_amount}"
  puts "Rate: #{(calculator.rate * 100).round(2)}%"
  puts "Monthly repayment: £#{calculator.monthly_payment.round(2)}"
  puts "Total repayment: £#{calculator.total_payment.round(2)}"
end

if calc.illegal_amount?
  puts 'Illegal loan amount. Amount should be in increment of 100 between 1000 and 1500'
elsif calc.not_enough_funds?
  puts "It is not possible to provide a quote at that time due to lack of funds on the market. Please try a smaller amount."
else
  output(calc)
end
