class Demo::Pages::Persons::Edit < Demo::Pages::Persons::Form

  def response
    jumbotron_header title: "Edit #{@person.first_name} #{@person.last_name}"

    div class: 'container  mb-5 pb-5 overlap-container' do
      div class: 'shadow'
      div class: 'row' do
        div class: 'col-12 pt-3' do
          paragraph text: 'Change everything you want. Hit "Save changes" in order to save your changes.', 
            class: 'alert alert-info pb-3'
          person_form 'Save changes', person_path(@person)
        end
      end
    end
  end

  private

  def person_form_config
    {
      for: @person,
      method: :patch,
      path: person_path,
      params: {
        id: @person.id
      },
      success: {
        transition: {
          follow_response: true, 
          delay: 300
        }
      }
    }
  end

end
