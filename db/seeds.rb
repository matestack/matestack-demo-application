seeded_persons = [
	{first_name: 'Harris', last_name: 'Bees', active: true, role: :client},
	{first_name: 'Abigail', last_name: 'Salte', active: true, role: :client},
	{first_name: 'Woodrow', last_name: 'Trembly', active: true, role: :client},
	{first_name: 'Murray', last_name: 'Fedorko', active: true, role: :client},
	{first_name: 'Michaele', last_name: 'Kritikos', active: false, role: :client},
	{first_name: 'Sammie', last_name: 'Scovill', active: false, role: :client},
	{first_name: 'Xavier', last_name: 'Accosta', active: false, role: :partner},
	{first_name: 'Otis', last_name: 'Morro', active: false, role: :partner},
	{first_name: 'Omer', last_name: 'Ottman', active: true, role: :partner},
	{first_name: 'Marlo', last_name: 'Yousko', active: true, role: :staff},
	{first_name: 'Manuel', last_name: 'Venn', active: true, role: :staff},
]

seeded_persons.each do |person|
	Person.create(person)
end