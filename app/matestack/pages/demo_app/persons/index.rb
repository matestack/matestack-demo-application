class Pages::DemoApp::Persons::Index < Matestack::Ui::Page

	def prepare
		@persons = Person.all
	end

	def response
		components {
			ul do
				@persons.each do |person|
					li do
						plain "#{person.first_name} #{person.last_name} "
						transition path: :person_path, params: {id: person.id}, text: '(Details)'
					end
				end
			end
		}
	end

end
