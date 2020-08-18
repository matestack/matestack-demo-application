class Demo::Pages::Persons::Form < Matestack::Ui::Page

  protected

  def person_form(button_text)
    form person_form_config, :include do
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
        transition path: :persons_path, class: 'btn btn-secondary my-3', text: 'Back to index page'
        button class: 'btn btn-primary', text: button_text
      end
    end
  end

  def person_form_config
    raise 'overwrite this method'
  end

end