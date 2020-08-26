class Components::Shared::JumbotronHeader < Matestack::Ui::Component

  optional :title

  def response
    div jumbotron_options do
      div class: 'container py-5' do
        heading text: title, class: 'pt-5'
      end
    end
  end

  private

  def jumbotron_options
    {
      class: 'jumbotron jumbotron-fluid text-secondary', 
      style: "background-image: url('#{image_path('background.jpg')}');"
    }
  end

end