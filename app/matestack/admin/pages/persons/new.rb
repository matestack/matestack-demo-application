class Admin::Pages::Persons::New < Admin::Pages::Persons::Form

  def prepare
    @person = Person.new
  end

  def response
    div class: 'container' do
      div class: 'row' do
        div class: 'col-md-6 offset-md-3 text-center' do
          heading size: 2, text: 'Create new person'
          person_form 'Create'
        end
      end
    end
  end

  def person_form_config
    {
      for: @person,
      method: :post,
      path: :admin_persons_path,
      success: {
        emit: 'person_form_success',
        transition: {
          follow_response: true
        }
      },
      failure: {
        emit: 'person_form_failure'
      }
    }
  end

end
