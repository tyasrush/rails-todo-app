class TodoosController < ApplicationController
  before_action :set_todoo, only: [:show, :edit, :update, :destroy]

  # GET /todoos
  # GET /todoos.json
  def index
    @todoos = Todoo.all
  end

  # GET /todoos/1
  # GET /todoos/1.json
  def show
  end

  # GET /todoos/new
  def new
    @todoo = Todoo.new
  end

  # GET /todoos/1/edit
  def edit
  end

  # POST /todoos
  # POST /todoos.json
  def create
    @todoo = Todoo.new(todoo_params)

    respond_to do |format|
      if @todoo.save
        format.html { redirect_to @todoo, notice: 'Todoo was successfully created.' }
        # format.json { render :show, status: :created, location: @todoo }
      else
        format.html { render :new }
        # format.json { render json: @todoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todoos/1
  # PATCH/PUT /todoos/1.json
  def update
    respond_to do |format|
      if @todoo.update(todoo_params)
        format.html { redirect_to @todoo, notice: 'Todoo was successfully updated.' }
        # format.json { render :show, status: :ok, location: @todoo }
      else
        format.html { render :edit }
        # format.json { render json: @todoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoos/1
  # DELETE /todoos/1.json
  def destroy
    @todoo.destroy
    respond_to do |format|
      format.html { redirect_to todoos_url, notice: 'Todoo was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoo
      @todoo = Todoo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoo_params
      params.require(:todoo).permit(:name, :time, :priority)
    end
end
