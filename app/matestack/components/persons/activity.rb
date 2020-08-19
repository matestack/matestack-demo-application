class Components::Persons::Activity < Matestack::Ui::DynamicComponent
  vue_js_component_name 'person-activity'

  def response
    div class: 'row pt-5' do
      div class: 'col' do
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
