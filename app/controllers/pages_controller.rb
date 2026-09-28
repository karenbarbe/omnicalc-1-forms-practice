class PagesController < ApplicationController
  def square
    render({ :template => "calculators/square" })
  end

  def square_root
    render({ :template => "calculators/square_root" })
  end

  def payment
    render({ :template => "calculators/payment" })
  end

  def random
    render({ :template => "calculators/random" })
  end

  def square_results
    @number = params.fetch("number")
    render({ :template => "calculators/square_results" })
  end

  def square_root_results
    @number = params.fetch("number")
    render({ :template => "calculators/square_root_results" })
  end

  def payment_results
    @user_years = params.fetch("user_years").to_f
    @user_pv = params.fetch("user_pv").to_f
    @user_apr = params.fetch("user_apr").to_f

    monthly_interest =  @user_apr / 100 / 12
    total_payments = @user_years * 12
    @payment = @user_pv * (monthly_interest * (1 + monthly_interest)**total_payments) / ((1 + monthly_interest)**total_payments - 1)
    @payment = @payment.round(2)
    render({ :template => "calculators/payment_results" })
  end

  def random_results
    @user_min = params.fetch("user_min")
    @user_max = params.fetch("user_max")
    render({ :template => "calculators/random_results" })
  end
end
