class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_not_in_index, only: [:new, :edit, :show]
  helper_method :sort_column, :sort_direction, :search_not_in_index

  # GET /books
  # GET /books.json
  def index
    if params[:tag]
      @books = Book.tagged_with(params[:tag]).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    else
      @books = Book.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find_by(id: params[:id])
    if @book.nil?
      @books = Book.all
      flash.now[:alert] = "您要找的書籍不存在。"
      render "index"
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = current_user.books.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: '恭喜！已成功建立書籍。' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = current_user.books.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: '更新成功！' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: '書籍已成功刪除。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :description, :picture, :price, :course, :tag_list, :legal, :original)
    end

    def sort_column
      Book.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def search_not_in_index
      if params[:search].present?
        redirect_to :action => 'index', :search => params[:search]
      end
    end
end
