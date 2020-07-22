class Pages::DemoApp::Persons::Show < Matestack::Ui::Page

  def prepare
    @other_persons = Person.where.not(id: @person.id).order("RANDOM()").limit(3)
  end

  def response
    components {
      section do
        div class: 'container' do
          transition path: :persons_path, class: 'btn btn-secondary', text: 'Back to index'

          div class: 'row' do
            div class: 'col-md-6 offset-md-3 text-center' do
              heading size: 2, text: "Name: #{@person.first_name} #{@person.last_name}"
              paragraph text: "Role: #{@person.role}"
              transition path: :edit_person_path, params: { id: @person.id }, class: 'btn btn-secondary', text: 'Edit'
              action delete_person_config do
                button class: 'btn btn-warning', text: 'Delete person'
              end
            end
          end
        end
      end

      partial :other_persons
      custom_person_activity
    }
  end

  def other_persons
    partial {
      section do
        div class: 'container' do
          div class: 'row' do
            div class: 'col-md-12 text-center' do
              heading size: 3, text: 'Three other persons:'
            end
            @other_persons.each do |person|
              div class: 'col-md-4' do
                custom_person_card person: person, path: :person_path
              end
            end
          end
        end
      end
    }
  end

  def delete_person_config
    return {
      method: :delete,
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
