class PoketypesController < ApplicationController
  before_action :set_poketype, only: %i[ show edit update destroy ]

  # GET /poketypes or /poketypes.json
  def index
    @poketypes = Poketype.all
  end

  # GET /poketypes/1 or /poketypes/1.json
  def show
  end

  # GET /poketypes/new
  def new
    @poketype = Poketype.new
  end

  # GET /poketypes/1/edit
  def edit
  end

  # POST /poketypes or /poketypes.json
  def create
    @poketype = Poketype.new(poketype_params)

    respond_to do |format|
      if @poketype.save
        format.html { redirect_to poketype_url(@poketype), notice: "Poketype was successfully created." }
        format.json { render :show, status: :created, location: @poketype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poketype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poketypes/1 or /poketypes/1.json
  def update
    respond_to do |format|
      if @poketype.update(poketype_params)
        format.html { redirect_to poketype_url(@poketype), notice: "Poketype was successfully updated." }
        format.json { render :show, status: :ok, location: @poketype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poketype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poketypes/1 or /poketypes/1.json
  def destroy
    @poketype.destroy

    respond_to do |format|
      format.html { redirect_to poketypes_url, notice: "Poketype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poketype
      @poketype = Poketype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poketype_params
      params.require(:poketype).permit(:poke_id, :name, :url)
    end
end
