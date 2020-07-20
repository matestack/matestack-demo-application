class Components::Person::Disclaimer < Matestack::Ui::DynamicComponent

  def response
    components {
      div id: 'disclaimer', class: 'container-fluid text-center', attributes: {"v-show": "show == true"} do
        span text: 'None of the presented names belong to and/or are meant to refer to existing human beings. They were created using a "Random Name Generator".'
        button class: 'btn btn-warning', attributes: {"@click": "show = false"}, text: 'Hide'
      end
    }
  end

end
