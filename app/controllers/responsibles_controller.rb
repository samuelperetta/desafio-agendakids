class ResponsiblesController   < ApplicationController
  before_filter :authenticate_user!
  before_action :set_responsible, only: [:show, :edit, :update, :destroy]

  def index
    @responsibles = Responsible.all
  end

  def show
  end

  def new
    @responsible = Responsible.new
    @responsible.students.build
  end

  def edit
    @method = :put
    @responsible.students.build
  end

  def create
    @responsible = Responsible.new(responsible_params)
    @students = Student.find(params[:students])
    respond_to do |format|
      if @responsible.save
        format.html { redirect_to @responsible, notice: 'Responsible was successfully created.' }
        format.json { render :show, status: :created, location: @responsible }
      else
        format.html { render :new }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @students = Student.where("id" => responsible_params["student_ids"])
      @responsible.students.delete_all
      @responsible.students << @students
      if @responsible.update(responsible_params)
        format.html { redirect_to @responsible, notice: 'Responsible was successfully updated.' }
        format.json { render :show, status: :ok, location: @responsible }
      else
        format.html { render :edit }
        format.json { render json: @responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @responsible.destroy
    respond_to do |format|
      format.html { redirect_to responsibles_url, notice: 'Responsible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_responsible
      @responsible = Responsible.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsible_params
      params.require(:responsible).permit(:name, :email, {:student_ids => []} )
    end
end
