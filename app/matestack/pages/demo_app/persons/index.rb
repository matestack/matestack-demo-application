class Pages::DemoApp::Persons::Index < Matestack::Ui::Page
  include Matestack::Ui::Core::Collection::Helper

  def prepare
    person_collection_id = "person-collection"

    current_filter = get_collection_filter(person_collection_id)

    person_query = Person.all

    filtered_person_query = person_query
    .where("last_name LIKE ?", "%#{current_filter[:last_name]}%")

    @person_collection = set_collection({
      id: person_collection_id,
      data: filtered_person_query
    })
  end

  def response
    components {
      partial :filter

      async rerender_on: "person-collection-update" do
        partial :content
      end

      transition path: :new_person_path, text: 'Create new person'
    }
  end

  def filter
    partial {
      collection_filter @person_collection.config do
        collection_filter_input key: :last_name, type: :text, placeholder: "Filter by Last name"
        collection_filter_submit do
          button text: "Apply"
        end
        collection_filter_reset do
          button text: "Reset"
        end
      end
    }
  end

  def content
    partial {
      collection_content @person_collection.config do

        ul do
          @person_collection.data.each do |person|
            li do
              plain "#{person.first_name} #{person.last_name} "
              transition path: :person_path, params: {id: person.id}, text: '(Details)'
            end
          end
        end

      end
    }
  end

end
