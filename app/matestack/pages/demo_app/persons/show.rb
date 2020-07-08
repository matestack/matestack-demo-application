class Pages::DemoApp::Persons::Show < Matestack::Ui::Page

  def response
    components {
      transition path: :persons_path, text: 'Back to index'
      heading size: 2, text: "Name: #{@person.first_name} #{@person.last_name}"
      paragraph text: "Role: #{@person.role}"
      transition path: :edit_person_path, params: { id: @person.id }, text: 'Edit'
      action delete_person_config do
        button text: 'Delete person'
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
