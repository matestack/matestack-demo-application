class Person < ApplicationRecord
	enum role: [:client, :partner, :staff]
end
