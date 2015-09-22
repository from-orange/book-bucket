class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  # before_action :correct_bucketter, only:[:show,:edit, :update,:destroy]
  before_action :signed_in_bucketter, only: [:new]
  # before_action :set_bucketter, only: [:new]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @book = @offer.book
    @bucketter = Bucketter.find(@offer.buyer_id)
  end

  # GET /offers/new
  def new
    @bucketter = current_bucketter
    @id = params[:para]
    @offer = Offer.new
    @book = Book.find_by(id: @id)
  end

  # GET /offers/1/edit
  def edit
    @book = @offer.book
  end

  # POST /offers
  # POST /offers.json
  def create
    book_id = params[:offer][:book_id]
    @book = Book.find(book_id)

    buyer_id = current_bucketter.id
    seller_id = @book.bucketter.id

    @offer = @book.offers.new(buyer_id: buyer_id,
                              seller_id: seller_id
                                      )

    if @offer.save
      BucketterMailer.purchase_mail(current_bucketter, @book).deliver_now
      flash[:success] = "Successfully Offerd"
      @book.update_attribute(:on_sale, false)
      redirect_to(current_bucketter)
    else
      render 'new'
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    @book = @offer.book
    if params[:offer][:deal_end]
      @book.deal_end = true
      if @book.save
        flash[:success] = 'Successfuly done!'
        redirect_to @book
      else
        flash[:success] = '!'
        redirect_to edit_offer_path(@offer)
      end
    else
      flash[:success] = '!'
      redirect_to edit_offer_path(@offer)
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit()
    end

    def correct_bucketter

    end

    def store_book
      current_book = @book
    end

    def current_book=(book)
      @current_book = book
    end

end
