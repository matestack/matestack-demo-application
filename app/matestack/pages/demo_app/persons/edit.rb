class Pages::DemoApp::Persons::Edit < Matestack::Ui::Page

  def response
    components {
      transition path: :person_path, params: { id: @person.id }, text: 'Back to detail page'
      heading size: 2, text: "Edit Person: #{@person.first_name} #{@person.last_name}"
      form person_edit_form_config, :include do
        label text: 'First name'
        form_input key: :first_name, type: :text
        br
        label text: 'Last name'
        form_input key: :last_name, type: :text
        br
        label text: 'Person role'
        form_select key: :role, type: :radio, options: Person.roles.keys
        br
        form_submit do
          button text: 'Save changes'
        end
      end
    }
  end

  def person_edit_form_config
    {
      for: @person,
      method: :patch,
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
