class Apps::DemoApp < Matestack::Ui::App

  def prepare
    @persons = Person.all
  end

  def response
    components {
      header do
        heading size: 1, text: 'Demo App'
        transition path: :first_page_path, text: 'First page'
        br
        transition path: :second_page_path, text: 'Second page'
      end
      main do
        page_content
        ul do
          @persons.each do |person|
            li do
              plain person.first_name
              strong text: person.last_name
            end
          end
        end
      end
    }
  end

end
