class Components::Person::Disclaimer < Matestack::Ui::DynamicComponent

  def response
    components {
      div attributes: {"v-show": "show == true"} do
        paragraph text: 'None of the presented names belong to and/or are meant to refer to existing human beings. They were created using a "Random Name Generator".'
        button attributes: {"@click": "show = false"}, text: 'Hide'
      end
    }
  end

end
