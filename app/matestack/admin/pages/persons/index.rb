class Admin::Pages::Persons::Index < Matestack::Ui::Page
  include Matestack::Ui::Core::Collection::Helper

  def prepare
    person_collection_id = "persons-collection"
    current_filter = get_collection_filter(person_collection_id)
    person_query = Person.all.order(id: :asc)
    filtered_person_query = person_query
      .where("last_name LIKE ?", "%#{current_filter[:last_name]}%")
    @person_collection = set_collection({
      id: person_collection_id,
      data: filtered_person_query,
			init_limit: 10,
			filtered_count: filtered_person_query.count,
			base_count: person_query.count
    })
  end

  def response
    div class: 'container my-5' do
      div class: 'text-right' do 
        transition class: 'btn btn-success mb-3', text: '+ New person', path: new_admin_person_path, delay: 300
      end
      filter
      async id: 'collection', rerender_on: 'persons-collection-update' do 
        collection_content @person_collection.config do
          table class: 'table table-striped table-light table-hover mt-3' do
            table_head
            table_body
          end
          paginator
        end
      end
    end
  end

  private

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

  def table_head
    tr do
      th text: '#'
      th text: 'Last name'
      th text: 'First name'
      th text: 'Role'
      th
    end
  end

  def table_body
    @person_collection.paginated_data.each do |person|
      tr do
        td text: person.id
        td do
          transition path: edit_admin_person_path(person), text: person.last_name, class: 'text-dark font-weight-bold', delay: 300
        end
        td text: person.first_name
        td text: person.role
        td class: 'text-right' do
          action delete_person_config(person) do
            button text: 'Delete', class: 'btn btn-outline-primary'
          end
        end
      end
    end
  end

  def paginator
    ul class: 'pagination justify-content-center' do
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


  def delete_person_config(person)
    {
      method: :delete,
      path: admin_person_path(person),
      success: {
        emit: 'persons-collection-update'
      },
      confirm: {
        text: "Do you really want to delete '#{person.first_name} #{person.last_name}'?"
      }
    }
  end

end
