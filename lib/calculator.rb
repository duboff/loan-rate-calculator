#!/usr/bin/ruby

require 'csv'

class Calculator

  attr_accessor :rate, :initial_amount, :lender_proposals
  attr_reader :n

  def initialize
    @n = 36
  end

  def get_rate
    if total_market < initial_amount
      rate = nil
      return true
    end

    sorted_proposals = self.lender_proposals.sort_by {|prop| prop[1] }
    rates = sorted_proposals.map {|prop| prop[1] }
    amts = sorted_proposals.map {|prop| prop[2] }
    result = 0
    amount = initial_amount
    rates.each_with_index do |cur_rate, i|
      a = [amts[i], amount].min
      result += cur_rate * a
      amount -= a if amount > 0
    end
    self.rate = (result / self.initial_amount).round(2)
  end

  def total_market
    self.lender_proposals.map {|prop| prop[2] }.inject(:+)
  end

  def monthly_rate
    rate / 12
  end

  def monthly_payment
    (monthly_rate * initial_amount / (1 - ((1 + monthly_rate) ** -n))).round(2)
  end

  def total_payment
    monthly_payment * n
  end

end
