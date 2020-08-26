class Demo::Pages::Persons::Index < Matestack::Ui::Page
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
			init_limit: 6,
			filtered_count: filtered_person_query.count,
			base_count: person_query.count
    })
  end

  def response
    jumbotron_header title: 'All your persons'
  
    div class: 'container overlap-container' do
      div class: 'shadow'
      div class: 'row pt-4' do
        div class: 'col-md-8' do
          filter
        end
        div class: 'col-md-4' do
          ordering
        end
      end
      async rerender_on: 'person-collection-update', id: 'person-collection' do
        content
      end
    end

    div class: 'jumbotron jumbotron-fluid text-secondary mt-5 text-center mb-0' do
      div class: 'container py-3' do
        heading text: 'You know another person?'
        div class: 'col-md-12 text-center my-3' do
          transition path: new_person_path, class: 'my-3 btn btn-primary btn-lg', text: 'Add one', delay: 300
        end
      end
    end
  end

  def filter
    collection_filter @person_collection.config do
      div class: 'd-flex' do
        collection_filter_input key: :last_name, type: :text, placeholder: 'Filter by Last name', class: 'form-control'
        collection_filter_submit do
          button class: 'btn btn-outline-primary ml-1', text: 'Apply'
        end
        collection_filter_reset do
          button class: 'btn btn-outline-secondary ml-1', text: 'Reset'
        end
      end
    end
  end

	def ordering
    collection_order @person_collection.config do
      div class: 'form-group d-flex justify-content-end' do
        label text: 'Sorted by:', class: 'col-form-label'
        div do
          collection_order_toggle key: :last_name do
            button class: 'btn btn-primary ml-2' do
              collection_order_toggle_indicator key: :last_name, 
                asc: 'Last name (A-Z)', desc: 'Last name (Z-A)', default: 'Date of creation'
            end
          end
        end
      end
    end
	end

  def content
    collection_content @person_collection.config do
      @person_collection.paginated_data.each do |person|
        person_teaser person: person
      end
      div class: 'row' do
        paginator
      end
    end
  end

	def paginator
    div class: 'col-md-12 text-center mt-5' do
      div class: 'p-2' do
        paginator_description
      end
      ul class: 'pagination justify-content-center' do
        li class: 'page-item' do
          collection_content_previous do
            div class: 'page-link' do
              span attributes: { 'aria-hidden': true }, text: '&laquo;'.html_safe
            end
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
            div class: 'page-link' do
              span attributes: { 'aria-hidden': true }, text: '&raquo;'.html_safe
            end
          end
        end
      end
    end
  end

  def paginator_description
    plain "Showing persons #{@person_collection.from}"
    plain "to #{@person_collection.to}"
    plain "of #{@person_collection.filtered_count}"
    plain "from a total of #{@person_collection.base_count} records."
  end

end
