class SchoolClassesController   < ApplicationController
  before_filter :authenticate_user!
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  def index
    @school_classes = SchoolClass.all
  end

  def show
  end

  def new
    @school_class = SchoolClass.new
    @school_class.students.build
  end

  def edit
    @method = :put
    @school_class.students.build
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    @students = Student.find(params[:students])
    respond_to do |format|
      if @school_class.save
        format.html { redirect_to @school_class, notice: 'SchoolClass was successfully created.' }
        format.json { render :show, status: :created, location: @school_class }
      else
        format.html { render :new }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @students = Student.where("id" => school_class_params["student_ids"])
      @school_class.students.delete_all
      @school_class.students << @students
      if @school_class.update(school_class_params)
        format.html { redirect_to @school_class, notice: 'SchoolClass was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_class }
      else
        format.html { render :edit }
        format.json { render json: @school_class.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school_class.destroy
    respond_to do |format|
      format.html { redirect_to school_classes_url, notice: 'SchoolClass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_school_class
      @school_class = SchoolClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_class_params
      params.require(:school_class).permit(:name, :email, {:student_ids => []} )
    end
end
