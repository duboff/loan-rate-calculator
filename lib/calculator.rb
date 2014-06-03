

require 'csv'

class Calculator

  attr_accessor :rate, :initial_amount, :lender_proposals
  attr_reader :n

  def initialize
    @n = 36.0
  end



  def get_rate
    result = 0
    amount = initial_amount
    rates.each_with_index do |cur_rate, i|
      a = [amounts[i], amount].min
      result += cur_rate * a
      amount -= a if amount > 0
    end
    not_enough_funds? ? rate = nil : self.rate = (result / self.initial_amount)
  end

  def sorted_proposals
    self.lender_proposals.sort_by {|prop| prop[1] }
  end

  def rates
    sorted_proposals.map {|prop| prop[1] }
  end

  def amounts
    sorted_proposals.map {|prop| prop[2] }
  end

  def total_market
    self.lender_proposals.map {|prop| prop[2] }.inject(:+)
  end

  def monthly_rate
    rate / 12
  end

  def monthly_payment
    return initial_amount / n if monthly_rate == 0
    monthly_rate * initial_amount / (1 - ((1 + monthly_rate) ** -n))
  end

  def total_payment
    monthly_payment * n
  end

  def illegal_amount?
    initial_amount > 1500 || initial_amount < 1000 || initial_amount % 100 != 0
  end

  def not_enough_funds?
    total_market < initial_amount
  end

end
