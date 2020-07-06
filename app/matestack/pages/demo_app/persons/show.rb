class Pages::DemoApp::Persons::Show < Matestack::Ui::Page

  def response
    components {
      transition path: :persons_path, text: 'Back to index'
      heading size: 2, text: "Name: #{@person.first_name} #{@person.last_name}"
      paragraph text: "Active: #{@person.active}"
      paragraph text: "Role: #{@person.role}"
    }
  end

end
