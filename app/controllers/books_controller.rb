class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index
    @top_rated_books = Book.joins(:reviews).group(:id).order('AVG(reviews.score) DESC').limit(10)
    @reviews_by_rating = @top_rated_books.map do |book|
      highest_review = book.reviews.order(score: :desc).first
      lowest_review = book.reviews.order(:score).first
      average_score = book.reviews.average(:score)
      [book, highest_review, lowest_review, average_score]
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @search_terms = params[:q].present? ? params[:q].split : []
    @books = Book.joins(:reviews).where("name ILIKE ANY (ARRAY[?]) OR reviews.review ILIKE ANY (ARRAY[?])", @search_terms.map { |term| "%#{term}%" }, @search_terms.map { |term| "%#{term}%" })
  
    if @books.present?
      @books = @books.distinct.page(params[:page])
    else
      @books = []
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :summary, :date_of_publication, :number_of_sales)
    end
end
