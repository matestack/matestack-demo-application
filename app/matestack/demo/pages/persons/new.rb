class Demo::Pages::Persons::New < Demo::Pages::Persons::Form

  def response
    section do
      div class: 'container' do
        div class: 'row' do
          div class: 'col-md-6 offset-md-3 text-center' do
            heading size: 2, text: 'Create new person'
            person_form 'Create person'
          end
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
          follow_response: true
        }
      }
    }
  end

end
