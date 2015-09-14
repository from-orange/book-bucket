class BuckettersController < ApplicationController
  before_action :set_bucketter, only: [:show, :edit, :update, :destroy]
  before_action :admin_bucketter, only: :destroy
  before_action :correct_bucketter, only: [:edit, :update]
  before_action :signed_in_bucketter, only: [:edit,:update, :destroy]

  # GET /bucketters
  # GET /bucketters.json
  def index
    @bucketters = Bucketter.all
  end

  # GET /bucketters/1
  # GET /bucketters/1.json
  def show
    bucketter_id = @bucketter.id
    @books = Book.where(bucketter_id: bucketter_id )
    @offers = Offer.where(buyer_id: bucketter_id)
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
        BucketterMailer.welcome_email(@bucketter).deliver_later
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
    redirect_to bucketters_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucketter
      @bucketter = Bucketter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucketter_params
      params.require(:bucketter).permit(:name, :email, :password,
                                        :password_confirmation,:address,
                                        :first_name,:last_name)
    end

    # Before actions

    # def signed_in_user
    #   redirect_to sigin_url, notice: "Please sign in." unless signed_in?
    # end

    def correct_bucketter
      @bucketter = Bucketter.find(params[:id])
      redirect_to(root_path) unless current_bucketter?(@bucketter)
    end

    def admin_bucketter
      redirect_to(root_path) if current_bucketter.admin?
    end
end
