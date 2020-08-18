class Demo::Pages::FirstPage < Matestack::Ui::Page

  def response
    div do
      heading text: 'Hello World!', size: 1
    end
  end

end
