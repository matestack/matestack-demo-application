class Components::Person::Card < Matestack::Ui::StaticComponent

  def prepare
    @person = @options[:person]
  end

  def response
    components {
      div do
        paragraph text: "#{@person.first_name} #{@person.last_name} "
        transition path: :person_path, params: {id: @person.id}, text: '(Details)'
      end
    }
  end

end
