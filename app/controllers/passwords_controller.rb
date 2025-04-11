class PasswordsController < ApplicationController
  def new
    puts "🎉 FORM SUBMITTED!"
  end

  def create
    length = params[:length].to_i
    use_upper = params[:use_upper].present?
    use_numbers = params[:use_numbers].present?
    use_special = params[:use_special].present?
  
    charset = ('a'..'z').to_a
    charset += ('A'..'Z').to_a if use_upper
    charset += ('0'..'9').to_a if use_numbers
    charset += %w[! @ # $ % ^ & *] if use_special
  
    password = Array.new(length) { charset.sample }.join
    redirect_to root_path(password: password)
  end
end
# This controller handles the password generation logic. It has two actions: