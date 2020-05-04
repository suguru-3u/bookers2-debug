class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_comments = BookComment.new(book_comments_params)
    book_comments.user_id = current_user.id
    book_comments.book_id = book.id
    book_comments.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @book_comments = BookComment.find_by(book_id: params[:book_id], user_id: current_user.id)
    @book_comments.destroy
    redirect_back(fallback_location: root_path)
  end

  def book_comments_params
      params.require(:book_comment).permit(:comment)
  end
end
