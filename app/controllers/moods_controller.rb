class MoodsController < ApplicationController
  #before_action :set_mood, only: %i[ index show new create edit update destroy ]
  before_action :authenticate_user!
  # GET /moods or /moods.json
  def index
    @moods = current_user.moods.all
  end

  # GET /moods/1 or /moods/1.json
  def show
    @mood = current_user.moods.find(params[:id])
  end

  # GET /moods/new
  def new
    @mood = current_user.moods.build
  end

  # GET /moods/1/edit
  def edit
    @mood = current_user.moods.find(params[:id])
  end

  # POST /moods or /moods.json
  def create
    @mood = current_user.moods.build(mood_params)

    respond_to do |format|
      if @mood.save
        format.html { redirect_to mood_url(@mood), notice: "Mood was successfully created." }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moods/1 or /moods/1.json
  def update
    @mood = current_user.moods.find(params[:id])
    respond_to do |format|
      if @mood.update(mood_params)
        format.html { redirect_to mood_url(@mood), notice: "Mood was successfully updated." }
        format.json { render :show, status: :ok, location: @mood }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moods/1 or /moods/1.json
  def destroy
    @mood = current_user.moods.find(params[:id])
    @mood.destroy

    respond_to do |format|
      format.html { redirect_to moods_url, notice: "Mood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood
      @mood = current_user.mood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mood_params
      params.require(:mood).permit(:vibe, :health, :productivity, :fun, :notes, :user_id)
    end
end
