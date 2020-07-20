class Components::Person::Card < Matestack::Ui::StaticComponent

  def prepare
    @person = @options[:person]
  end

  def response
    components {
      div class: 'card' do
        div class: 'card-body' do
          paragraph text: "#{@person.first_name} #{@person.last_name}"
          transition path: :person_path, params: {id: @person.id}, class: 'btn btn-primary', text: 'Details'
        end
      end
    }
  end

end
