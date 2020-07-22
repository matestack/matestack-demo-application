class Pages::AdminApp::Persons::New < Matestack::Ui::Page

  def prepare
    @person = Person.new
  end

  def response
    components {
      section do
        div class: 'container' do
          div class: 'row' do
            div class: 'col-md-6 offset-md-3 text-center' do
              heading size: 2, text: 'Create new person'
              form new_person_form_config, :include do
                div class: 'form-group row' do
                  label class: 'col-sm-4 col-form-label col-form-label-md', text: 'First name:'
                  div class: 'col-sm-8' do
                    form_input key: :first_name, class: 'form-control', type: :text
                  end
                end
                div class: 'form-group row' do
                  label class: 'col-sm-4 col-form-label col-form-label-md', text: 'Last name:'
                  div class: 'col-sm-8' do
                    form_input key: :last_name, class: 'form-control', type: :text
                  end
                end
                div class: 'form-group row' do
                  label class: 'col-sm-4 col-form-label col-form-label-md', text: 'Person role:'
                  div class: 'col-sm-8' do
                    form_select key: :role, type: :dropdown, class: 'form-control', options: Person.roles.keys, init: Person.roles.keys.first
                  end
                end
                form_submit do
                  transition path: :persons_path, class: 'btn btn-secondary my-3', text: 'Back to index page'
                  button class: 'btn btn-primary', text: 'Create person'
                end
              end
            end
          end
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
