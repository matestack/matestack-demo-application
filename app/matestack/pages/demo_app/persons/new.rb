class Pages::DemoApp::Persons::New < Matestack::Ui::Page

  def prepare
    @person = Person.new
  end

  def response
    components {
      transition path: :persons_path, text: 'Back to index page'
      heading size: 2, text: 'Create new person'
      form new_person_form_config, :include do
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
          button text: 'Create person'
        end
      end
    }
  end

  def new_person_form_config
    {
      for: @person,
      method: :post,
      path: :persons_path,
      success: {
        transition: {
          follow_response: true
        }
      }
    }
  end

end
