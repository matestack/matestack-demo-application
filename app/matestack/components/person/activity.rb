class Components::Person::Activity < Matestack::Ui::DynamicComponent

  def response
    components {
      section do
        div class: 'container' do
          div class: 'row' do
            div class: 'col-md-6 offset-md-3' do
              paragraph class: 'text-center' do
                plain 'Need ideas on what to do with one of these persons?'
                button attributes: {"@click": "addActivity()"}, class: 'btn btn-primary', text: 'Click here'
              end
              ul attributes: {"v-if": "activities.length"}, class: 'list-group' do
                li attributes: {"v-for": "activity,index in activities"}, class: 'list-group-item d-flex justify-content-between align-items-center' do
                  plain "{{activity}}"
                  span attributes: {"@click": "deleteActivity(index)"}, class: 'badge badge-primary badge-pill', text: 'X'
                end
              end
            end
          end
        end
      end
    }
  end

end
