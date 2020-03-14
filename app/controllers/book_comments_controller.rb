class BookCommentsController < ApplicationController
	def create
	    book = Book.find(params[:book_id])
	    comment = current_user.book_comments.new(post_comment_params)
	    comment.book_id = book.id
	    comment.save
	    # logger.debug comment.inspect
	    # logger.debug "ここみる"
    	redirect_back(fallback_location: root_path)
	end

    def destroy
        comment = BookComment.find(params[:book_id])
        comment.destroy
    	redirect_back(fallback_location: root_path)
        end

	private
	def post_comment_params
	    params.require(:book_comment).permit(:comment)
	end
end