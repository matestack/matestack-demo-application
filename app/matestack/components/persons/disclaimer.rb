class Components::Persons::Disclaimer < Matestack::Ui::Component

  def response
    toggle hide_on: 'hide_disclaimer' do
      div class: 'disclaimer-component container-fluid text-center shadow-md' do
        disclaimer_text
        onclick emit: 'hide_disclaimer' do
          button class: 'btn', attributes: {"@click": "show = false"}, text: 'Hide'
        end
      end
    end
  end

  def disclaimer_text
    span text: 'None of the presented names belong to and/or are meant to refer to existing human beings. 
      They were created using a "Random Name Generator".'
  end

end
