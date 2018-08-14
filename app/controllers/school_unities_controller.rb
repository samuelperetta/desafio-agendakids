class SchoolUnitiesController < ApplicationController
  before_action :set_school_unity, only: [:show, :edit, :update, :destroy]

  def index
    @school_unities = SchoolUnity.all
  end

  def show
  end

  def new
    @school_unity = SchoolUnity.new
  end

  def create
    @school_unity = SchoolUnity.new school_unity_params
    if @school_unity.save
      redirect_to school_unities_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @school_unity.update(school_unity_params)
      redirect_to school_unities_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to school_unities_path if @school_unity.destroy
  end

  private
  def set_school_unity
    @school_unity = SchoolUnity.find(params[:id])
  end

  def school_unity_params
    params.require(:school_unity).permit(:name, :address)
  end
end
