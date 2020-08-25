class Demo::Pages::Persons::New < Demo::Pages::Persons::Form

  def response
    jumbotron_header title: 'Create a new person'

    div class: 'container  mb-5 pb-5 overlap-container' do
      div class: 'shadow'
      div class: 'row' do
        div class: 'col-12 pt-3' do
          paragraph class: 'alert alert-info pb-3',
            text: 'Enter a first name, last name and select a role. Hit "Create person" in order to save your new person.'
          person_form 'Create person', persons_path
        end
      end
    end
  end

  private

  def person_form_config
    {
      for: Person.new,
      method: :post,
      path: persons_path,
      success: {
        transition: {
          follow_response: true, 
          delay: 300
        }
      }
    }
  end

end
