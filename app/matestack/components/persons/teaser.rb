class Components::Persons::Teaser < Matestack::Ui::StaticComponent

  requires :person

  def response
    div class: 'media mt-3 p-2 bg-light shadow-sm' do
      div class: 'mr-3 profile-placeholder bg-dark text-white' do
        plain person.first_name.slice(0)
      end
      div class: 'media-body' do
        div class: 'd-flex' do
          div class: 'w-100' do 
            heading text: "#{person.first_name} #{person.last_name}", size: 5
            small text: "Created at: #{I18n.l(person.created_at, format: :short)}", class: 'd-block'
          end
          div do
            transition text: 'Details', path: person_path(person), class: 'btn btn-primary float-right mt-3', delay: 300
          end
        end
      end
    end
  end

end
