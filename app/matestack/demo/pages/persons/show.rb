class Demo::Pages::Persons::Show < Matestack::Ui::Page

  def response
      section do
        div class: 'container' do
          transition path: persons_path, class: 'btn btn-secondary', text: 'Back to index'

          div class: 'row' do
            div class: 'col-md-6 offset-md-3 text-center' do
              heading size: 2, text: "Name: #{@person.first_name} #{@person.last_name}"
              paragraph text: "Role: #{@person.role}"
              transition path: edit_person_path(@person), class: 'btn btn-secondary', text: 'Edit'
              action delete_person_config do
                button class: 'btn btn-warning', text: 'Delete person'
              end
            end
          end
        end
      end
      custom_person_activity
  end

  def delete_person_config
    {
      method: :delete,
      path: person_path(@person)
      success: {
        transition: {
          follow_response: true
        }
      }
    }
  end

end
