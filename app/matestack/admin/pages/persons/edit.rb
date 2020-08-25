class Admin::Pages::Persons::Edit < Admin::Pages::Persons::Form

  def response
    div class: 'container my-5' do
      div class: 'row' do
        div class: 'col-md-6 offset-md-3 text-center' do
          heading size: 2, text: "Edit Person: #{@person.first_name} #{@person.last_name}"
          person_form 'Save changes'
        end
      end
    end
  end

  def person_form_config
    {
      for: @person,
      method: :patch,
      path: admin_person_path(@person),
      success: {
        emit: 'person_form_success'
      },
      failure: {
        emit: 'person_form_failure'
      }
    }
  end

end
