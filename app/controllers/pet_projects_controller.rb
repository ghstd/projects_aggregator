class PetProjectsController < ApplicationController
  def index
    @pet_projects = PetProject.all
  end

  def show
    @pet_project = PetProject.find(params[:id])
  end
end
