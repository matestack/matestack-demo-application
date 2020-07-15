class Components::Person::Activity < Matestack::Ui::DynamicComponent

  def response
    components {
      div do
        paragraph do
          plain 'Need ideas on what to do with one of these persons?'
          button attributes: {"@click": "addActivity()"}, text: 'Click here'
        end
        ul attributes: {"v-if": "activities.length"} do
          li attributes: {"v-for": "activity,index in activities"} do
            plain "{{activity}}"
            button attributes: {"@click": "deleteActivity(index)"}, text: 'Remove'
          end
        end
      end
    }
  end

end
