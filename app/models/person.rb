class Person < ApplicationRecord
	enum role: { client: 0, partner: 1, staff: 2 }

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :role, presence: true
end
