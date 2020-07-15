class Pages::DemoApp::Persons::Index < Matestack::Ui::Page
  include Matestack::Ui::Core::Collection::Helper

  def prepare
    person_collection_id = "person-collection"

    current_filter = get_collection_filter(person_collection_id)
		current_order = get_collection_order(person_collection_id)

		person_query = Person.all

    filtered_person_query = person_query
    .where("last_name LIKE ?", "%#{current_filter[:last_name]}%")
		.order(current_order)

    @person_collection = set_collection({
      id: person_collection_id,
      data: filtered_person_query,
			init_limit: 3,
			filtered_count: filtered_person_query.count,
			base_count: person_query.count
    })
  end

  def response
    components {
      partial :filter
			partial :ordering

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

	def ordering
		partial {
			collection_order @person_collection.config do

				plain "sort by:"
				collection_order_toggle key: :last_name do
					button do
						plain "last_name"
						collection_order_toggle_indicator key: :last_name, asc: '(A-Z)', desc: '(Z-A)'
					end
				end

			end
		}
	end

  def content
    partial {
      collection_content @person_collection.config do
				@person_collection.paginated_data.each do |person|
          custom_person_card person: person
        end
				partial :paginator
      end
    }
  end

	def paginator
		partial {
			plain "showing #{@person_collection.from}"
			plain "to #{@person_collection.to}"
			plain "of #{@person_collection.filtered_count}"
			plain "from total #{@person_collection.base_count}"

			collection_content_previous do
				button text: "previous"
			end

			@person_collection.pages.each do |page|
				collection_content_page_link page: page do
					button text: page
				end
			end

			collection_content_next do
				button text: "next"
			end
		}
	end

end
