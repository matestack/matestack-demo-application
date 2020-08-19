class PersonsController < ApplicationController
  matestack_app Demo::App

  before_action :find_person, only: [:show, :edit, :update, :destroy]

  def new
    render Demo::Pages::Persons::New
  end

  def index
    render Demo::Pages::Persons::Index
  end

  def show
    render Demo::Pages::Persons::Show
  end

  def edit
    render Demo::Pages::Persons::Edit
  end

  def update
    @person.update person_params

    @person.save
    if @person.errors.any?
      render json: {errors: @person.errors}, status: :unprocessable_entity
    else
      render json: { transition_to: person_path(id: @person.id) }, status: :ok
    end
  end

  def create
    @person = Person.new(person_params)
    p @person
    @person.save

    if @person.errors.any?
      render json: {errors: @person.errors}, status: :unprocessable_entity
    else
      render json: { transition_to: person_path(id: @person.id) }, status: :created
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
      :role
    )
  end

end
