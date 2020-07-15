class Pages::DemoApp::Persons::Show < Matestack::Ui::Page

  def prepare
    @other_persons = Person.where.not(id: @person.id).order("RANDOM()").limit(3)
  end

  def response
    components {
      transition path: :persons_path, text: 'Back to index'
      heading size: 2, text: "Name: #{@person.first_name} #{@person.last_name}"
      paragraph text: "Role: #{@person.role}"
      transition path: :edit_person_path, params: { id: @person.id }, text: 'Edit'
      action delete_person_config do
        button text: 'Delete person'
      end
      partial :other_persons
    }
  end

  def other_persons
    partial {
      heading size: 3, text: 'Three other persons:'
      @other_persons.each do |person|
        custom_person_card person: person
      end
    }
  end

  def delete_person_config
    return {
      method: :delete,
      path: :person_path,
      params: {
        id: @person.id
      },
      success: {
        transition: {
          follow_response: true
        }
      }
    }
  end

end
