#!/usr/bin/ruby

class Calculator

  attr_accessor :rate, :initial_amount, :lender_proposals

  def get_rate
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

end
