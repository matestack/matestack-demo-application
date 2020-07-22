class Pages::DemoApp::Persons::Edit < Matestack::Ui::Page

  def response
    components {
      section do
        div class: 'container' do
          div class: 'row' do
            div class: 'col-md-6 offset-md-3 text-center' do
              heading size: 2, text: "Edit Person: #{@person.first_name} #{@person.last_name}"
              form person_edit_form_config, :include do
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
                form_submit do
                  transition path: :person_path, params: { id: @person.id }, class: 'btn btn-secondary my-3', text: 'Back to detail page'
                  button class: 'btn btn-primary', text: 'Save changes'
                end
              end
            end
          end
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
