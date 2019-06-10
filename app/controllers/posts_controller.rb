class PostsController < ApplicationController
	 before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
       respond_to do |format| 
        format.html { redirect_to @post }
        format.json { render :show, status: :created, location: @foo.model }
        format.js 
       end
    else
    	respond_to do |format|
	      format.html { render :new }
	      format.json { render json: @post.errors, status: :unprocessable_entity }
	      format.js   { render layout: false, content_type: 'text/javascript' }
    	end
    end
	end

	def show
	end

	def update

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path

	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
	 @post = Post.find(params[:id])
	end

end
