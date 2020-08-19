class Demo::Pages::Persons::Show < Matestack::Ui::Page

  def response
    jumbotron_header

    div class: 'container mb-5 pb-5 overlap-container' do
      div class: 'shadow'
      div class: 'row pt-5' do
        person_header
      end
      div class: 'row' do
        person_role
      end
      person_more_information
      person_activity
    end

  end

  private

  def person_header
    div class: 'col-sm-8 d-flex align-items-center' do
      div class: 'mr-3 profile-placeholder bg-dark text-white' do
        plain @person.first_name.slice(0)
      end
      heading size: 2, text: "#{@person.first_name} #{@person.last_name}", class: 'my-0'
    end
    div class: 'col-sm-4 d-flex justify-content-end align-items-center' do
      transition path: edit_person_path(@person), class: 'btn btn-primary mr-2', text: 'Edit'
      action delete_person_config do
        button class: 'btn btn-secondary', text: 'Delete'
      end
    end
  end

  def person_role
    div class: 'col' do
      heading size: 4, class: ' mt-5 mb-4' do
        plain 'Role'
        span text: @person.role, class: 'badge badge-info'
      end
    end
  end

  def person_more_information
    
    div class: 'row my-3' do
      div class: 'col-12' do
        onclick emit: 'show_more' do
          button text: '+ Show more', class: 'btn btn-light text-primary font-weight-bold'
        end
      end
    end

    toggle show_on: 'show_more' do
      div class: 'row bg-light shadow-sm' do
        div class: 'col' do
          paragraph class: 'my-3 m-0' do
            b text: "Created at: "
            plain I18n.l(@person.created_at, format: :short)
          end
          paragraph class: 'my-3 m-0' do
            b text: "Updated at: "
            plain I18n.l(@person.updated_at, format: :short)
          end
        end
      end
    end
  end

  def delete_person_config
    {
      method: :delete,
      path: person_path(@person),
      success: {
        transition: {
          follow_response: true
        }
      }
    }
  end

end
