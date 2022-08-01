class MoodsController < ApplicationController
  before_action :set_mood, only: %i[ show edit update destroy ]

  # GET /moods or /moods.json
  def index
    @moods = Mood.all
  end

  # GET /moods/1 or /moods/1.json
  def show
    @mood = Mood.find(params[:id])
  end

  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # GET /moods/1/edit
  def edit
  end

  # POST /moods or /moods.json
  def create
    @mood = Mood.new(mood_params)

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
    @mood.destroy

    respond_to do |format|
      format.html { redirect_to moods_url, notice: "Mood was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mood
      @mood = Mood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mood_params
      params.require(:mood).permit(:vibe, :health, :productivity, :fun, :notes, :user_id)
    end
end
