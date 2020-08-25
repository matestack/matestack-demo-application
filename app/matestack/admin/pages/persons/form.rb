class Admin::Pages::Persons::Form < Matestack::Ui::Page

  protected

  def person_form(save_button)
    form person_form_config, :include do
      form_group label: 'First name:' do
        form_input key: :first_name, class: 'form-control', type: :text
      end
      form_group label: 'Last name:' do
        form_input key: :last_name, class: 'form-control', type: :text
      end
      form_group label: 'Last name:' do
        form_select key: :role, type: :dropdown, class: 'form-control', options: Person.roles.keys
      end
      form_submit do
        transition path: admin_persons_path, class: 'btn btn-secondary my-3', text: 'Cancel'
        button class: 'btn btn-primary', text: save_button
      end
    end
  end

  def person_form_config
    raise 'implement in inheriting class'
  end

  def form_group(label: '', &block)
    div class: 'form-group row' do
      label class: 'col-sm-4 col-form-label col-form-label-md', text: label
      div class: 'col-sm-8' do
        yield
      end
    end
  end

end