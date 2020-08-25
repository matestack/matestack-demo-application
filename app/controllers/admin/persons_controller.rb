class Admin::PersonsController < Admin::BaseController
  matestack_app Admin::App
  before_action :find_person, only: [:show, :edit, :update, :destroy]

  def new
    render Admin::Pages::Persons::New
  end

  def index
    render Admin::Pages::Persons::Index
  end

  def edit
    render Admin::Pages::Persons::Edit
  end

  def update
    if @person.update person_params
      render json: { }, status: :ok
    else
      render json: { errors: @person.errors }, status: :unprocessable_entity
    end
  end

  def create
    person = Person.create(person_params)
    if person.save
      render json: { transition_to: edit_admin_person_path(person) }, status: :created
    else
      render json: { errors: person.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @person.destroy
      render json: { transition_to: persons_path }, status: :ok
    else
      render json: {errors: @person.errors}, status: :unprocessable_entity
    end
  end

  protected

  def find_person
    @person = Person.find_by(id: params[:id])
  end

  def person_params
    params.require(:person).permit(
      :first_name,
      :last_name,
      :active,
      :role
    )
  end

end
