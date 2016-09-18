class ShareDreamsController < ApplicationController
  before_action :set_share_dream, only: [:show, :edit, :update, :destroy]

  # GET /share_dreams
  # GET /share_dreams.json
  def index
    @share_dreams = ShareDream.all
  end

  # GET /share_dreams/1
  # GET /share_dreams/1.json
  def show
  end

  # GET /share_dreams/new
  def new
    @share_dream = ShareDream.new
  end

  # GET /share_dreams/1/edit
  def edit
  end

  # POST /share_dreams
  # POST /share_dreams.json
  def create
    @share_dream = ShareDream.new(share_dream_params)

    respond_to do |format|
      if @share_dream.save
        format.html { redirect_to @share_dream, notice: 'Share dream was successfully created.' }
        format.json { render :show, status: :created, location: @share_dream }
      else
        format.html { render :new }
        format.json { render json: @share_dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_dreams/1
  # PATCH/PUT /share_dreams/1.json
  def update
    respond_to do |format|
      if @share_dream.update(share_dream_params)
        format.html { redirect_to @share_dream, notice: 'Share dream was successfully updated.' }
        format.json { render :show, status: :ok, location: @share_dream }
      else
        format.html { render :edit }
        format.json { render json: @share_dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_dreams/1
  # DELETE /share_dreams/1.json
  def destroy
    @share_dream.destroy
    respond_to do |format|
      format.html { redirect_to share_dreams_url, notice: 'Share dream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_dream
      @share_dream = ShareDream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_dream_params
      params.require(:share_dream).permit(:tittle, :description)
    end
end
