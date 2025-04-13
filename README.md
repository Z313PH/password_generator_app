# 🔐 Password Generator (Rails)

A simple Ruby on Rails web app that generates secure passwords based on user-selected options.

## ✨ Features

- Choose password length
- Optionally include:
  - Uppercase letters
  - Numbers
  - Special characters

## 🛠 Tech

- Ruby 3.2.2
- Rails 7
- ERB templates

## 🚀 Run Locally
Clone the repo
```bash
cd password-generator-rails
bundle install
rails server

## ✅ Testing

This project uses **RSpec** for testing the application's core logic, including password generation and file-based storage.

### 🧪 Setup

To install and set up RSpec:

```bash
bundle install
rails generate rspec:install
bundle exec rspec