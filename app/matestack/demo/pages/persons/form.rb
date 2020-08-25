class Demo::Pages::Persons::Form < Matestack::Ui::Page

  protected

  def person_form(button_text, cancel_path)
    form person_form_config, :include do
      div class: 'form-group row' do
        label class: 'col-md-3 col-sm-4 col-form-label col-form-label-md', text: 'First name:'
        div class: 'col-md-9 col-sm-8' do
          form_input key: :first_name, class: 'form-control', type: :text
        end
      end
      div class: 'form-group row' do
        label class: 'col-md-3 col-sm-4 col-form-label col-form-label-md', text: 'Last name:'
        div class: 'col-md-9 col-sm-8' do
          form_input key: :last_name, class: 'form-control', type: :text
        end
      end
      div class: 'form-group row' do
        label class: 'col-md-3 col-sm-4 col-form-label col-form-label-md', text: 'Role:'
        div class: 'col-md-9 col-sm-8' do
          form_radio key: :role, options: Person.roles.keys
        end
      end
      form_submit do
        button class: 'btn btn-primary', text: button_text
      end
      transition path: cancel_path, class: 'btn btn-secondary my-3', text: 'Cancel', delay: 300
    end
  end

  def person_form_config
    raise 'overwrite this method'
  end

end