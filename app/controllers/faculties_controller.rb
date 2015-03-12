class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
# newly created method. then put into routes file and created views
  def show_querystring
    @name = params[:name]
    @number_of_rooms = params[:quantity]
  end

def show_route_id
  @id = params[:id].to_i
  @faculties = Faculty.all

    if @id > @faculties.count
      @exists = false
    else
      @exists = true
      @faculty = Faculty.find(@id)
    end 
end

def find_by_form
end

def display_by_form
  @faculties = Faculty.all 
  @exists = false

  if params[:input].to_i < @faculties.count
    @exists = true
    @faculty = Faculty.find(params[:input])  
  end
end

def choose_color
end

def set_color
  @color = params[:color]
end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:name, :email)
    end
end
