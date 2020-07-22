class Pages::AdminApp::Persons::Index < Matestack::Ui::Page
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
      section id: 'persons-filter-order' do
        div class: 'container' do
          div class: 'row' do
            div class: 'offset-md-1 col-md-5' do
              partial :filter
            end
            div class: 'col-md-5' do
              partial :ordering
            end
          end
        end
      end

      section id: 'persons-collection' do
        div class: 'container' do
          async rerender_on: 'person-collection-update' do
            partial :content
          end
        end
      end
    }
  end

  def filter
    partial {
      collection_filter @person_collection.config do
        collection_filter_input key: :last_name, type: :text, placeholder: 'Filter by Last name'
        collection_filter_submit do
          button class: 'btn btn-primary', text: 'Apply'
        end
        collection_filter_reset do
          button class: 'btn btn-primary', text: 'Reset'
        end
      end
    }
  end

	def ordering
		partial {
			collection_order @person_collection.config do
				plain 'Sorted by:'
				collection_order_toggle key: :last_name do
					button class: 'btn btn-primary' do
						collection_order_toggle_indicator key: :last_name, asc: 'Last name (A-Z)', desc: 'Last name (Z-A)', default: 'Date of creation'
					end
				end
			end
		}
	end

  def content
    partial {
      collection_content @person_collection.config do
        div class: 'row' do
  				@person_collection.paginated_data.each do |person|
            div class: 'col-md-4' do
              custom_person_card person: person
            end
          end
          div class: 'col-md-12 text-center my-3' do
            transition path: :new_person_path, class: 'my-3 btn btn-info', text: 'Create new person'
          end
  				partial :paginator
        end
      end
    }
  end

	def paginator
		partial {
      div class: 'container' do
        div class: 'row' do
          div class: 'col-md-12 text-center mt-5' do
            plain "Showing persons #{@person_collection.from}"
            plain "to #{@person_collection.to}"
            plain "of #{@person_collection.filtered_count}"
            plain "from a total of #{@person_collection.base_count} records."
            ul class: 'pagination' do
              li class: 'page-item' do
                collection_content_previous do
                  button class: 'page-link', text: 'previous'
                end
              end
              @person_collection.pages.each do |page|
                li class: 'page-item' do
                  collection_content_page_link page: page do
                    button class: 'page-link', text: page
                  end
                end
              end
              li class: 'page-item' do
                collection_content_next do
                  button class: 'page-link', text: 'next'
                end
              end
            end
          end
        end
      end
		}
	end

end
