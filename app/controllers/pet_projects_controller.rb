class PetProjectsController < ApplicationController
  def index
    @pagy, @pet_projects = pagy(PetProject.order(sort_field => sort_type), page: params[:page], limit: 3)
  end

  def show
    @pet_project = PetProject.find(params[:id])
  end

  private

  def sort_field
    params[:sort] == "2" ? :is_game : :age
  end

  def sort_type
    case params[:sort]
      when "0" then :asc
      when "1" then :desc
      when "2" then :desc
      else :asc
    end
  end
end
