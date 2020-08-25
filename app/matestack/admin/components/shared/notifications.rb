class Admin::Components::Shared::Notifications < Matestack::Ui::Component

  def response
    div class: 'alert-wrapper' do
      # alerts for new and edit person forms
      notification_badge :person_form_success, :success, 'Person successfully updated'
      notification_badge :person_form_failure, :danger, 'There was an error while saving the person.'
      
      # alerts for login
      notification_badge :login_failure, :danger, 'Login incorrect'
    end
  end

  private

  def notification_badge(event, type, message)
    toggle show_on: event, hide_after: 3000 do
      div class: "alert alert-#{type} alert-dismissible" do
        plain message
        button class: 'close', attributes: { 'data-dismiss': :alert, 'aria-label': 'Close' } do
          span text: '&times;'.html_safe
        end
      end
    end
  end

end