class Demo::Pages::Persons::Edit < Demo::Pages::Persons::Form

  def response
    section do
      div class: 'container' do
        div class: 'row' do
          div class: 'col-md-6 offset-md-3 text-center' do
            heading size: 2, text: "Edit Person: #{@person.first_name} #{@person.last_name}"
            person_form 'Save changes'
          end
        end
      end
    end
  end

  private

  def person_form_config
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
