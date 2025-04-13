require 'json'

class PasswordsController < ApplicationController

  DB_PATH = Rails.root.join('Database', 'db.json')
  def load_passwords
    JSON.parse(File.read(DB_PATH))
  rescue 
    []
  end

  def save_passwords(data)
    File.write(DB_PATH, JSON.pretty_generate(data))
  end

  # def new
  #   puts "🎉 FORM SUBMITTED!"
  # end

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

    data = load_passwords
    data << {
      "id" => SecureRandom.uuid,
      "date" => Time.now.strftime("%Y-%m-%d"),
      "password" => password,
      "strength" => @strength
    }
    save_passwords(data)
    redirect_to root_path(password: password, strength: @strength)
  end

  def destroy
    data = load_passwords
    id = params[:id]
    data.reject! { |entry| entry["id"] == id }
    save_passwords(data)
    redirect_to root_path
  end
end
# This controller handles the password generation logic, it can also save, and delete generated passords.