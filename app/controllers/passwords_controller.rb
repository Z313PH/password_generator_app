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
    strength_score = 0
    strength_score += 1 if password.length >= 8
    strength_score += 1 if password.match(/[A-Z]/)
    strength_score += 1 if password.match(/[0-9]/)
    strength_score += 1 if password.match(/[^A-Za-z0-9]/)

    @strength = case strength_score
            when 0..1 then "Weak"
            when 2 then "Moderate"
            when 3 then "Strong"
            else "Very Strong"
            end
    redirect_to root_path(password: password, strength: @strength)
  end
end
# This controller handles the password generation logic. It has two actions: