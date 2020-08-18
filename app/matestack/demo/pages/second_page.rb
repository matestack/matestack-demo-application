class Demo::Pages::SecondPage < Matestack::Ui::Page

  def response
    div do
      heading size: 1, text: 'I am the second page!'
      paragraph text: "I'm a paragraph on the second page."
    end
  end

end