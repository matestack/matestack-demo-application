class Demo::Pages::FirstPage < Matestack::Ui::Page

  def response
    div do
      heading text: 'Hello World!', size: 1
    end
    description
  end

  private

  def description
    paragraph text: 'This is our first page, which now uses a partial'
  end

end