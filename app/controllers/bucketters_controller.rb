class BuckettersController < ApplicationController
  before_action :set_bucketter, only: [:show, :edit, :update, :destroy]

  # GET /bucketters
  # GET /bucketters.json
  def index
    @bucketters = Bucketter.all
  end

  # GET /bucketters/1
  # GET /bucketters/1.json
  def show
  end

  # GET /bucketters/new
  def new
    @bucketter = Bucketter.new
  end

  # GET /bucketters/1/edit
  def edit
    @bucketter = Bucketter.find(params[id])
  end

  # POST /bucketters
  # POST /bucketters.json
  def create
    @bucketter = Bucketter.new(bucketter_params)
      if @bucketter.save
        sign_in @bucketter
        redirect_to @bucketter
      else
        render 'new'
      end
  end

  # PATCH/PUT /bucketters/1
  # PATCH/PUT /bucketters/1.json
  def update
    respond_to do |format|
      if @bucketter.update(bucketter_params)
        format.html { redirect_to @bucketter, notice: 'Bucketter was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucketter }
      else
        format.html { render :edit }
        format.json { render json: @bucketter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bucketters/1
  # DELETE /bucketters/1.json
  def destroy
    @bucketter.destroy
    respond_to do |format|
      format.html { redirect_to bucketters_url, notice: 'Bucketter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucketter
      @bucketter = Bucketter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucketter_params
      params.require(:bucketter).permit(:name, :email, :password,
                                        :password_confirmation)
    end
end
