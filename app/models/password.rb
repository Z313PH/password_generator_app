class Password < ApplicationRecord
    validates :password, presence: true
    validates :strength, presence: true
end
