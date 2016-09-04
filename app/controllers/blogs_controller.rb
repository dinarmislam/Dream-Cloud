class BlogsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:category].blank?
			@blogs= Blog.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		else
			@category_id = Category.find_by(name: params[:category]).id
			@blogs = Blog.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		end
  end
  def new
    @blog=Blog.new
  end
  def create
    @blog= Blog.new(blog_params)
		if @blog.save
			redirect_to @blog
		else
			render 'new'
		end

  end
  def show
		@blog= Blog.find(params[:id])

    @new_comment    = Comment.build_from(@blog, current_user.id, "")

	end

	def edit
		@blog = Blog.find(params[:id])

	end

	def update
		@blog = Blog.find(params[:id])

		if @blog.update(params[:blog].permit(:title, :body, :image, :category_id))
			redirect_to @blog
		else
			render 'edit'
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy

		redirect_to root_path
	end




	private
		def blog_params
			params.require(:blog).permit(:title, :body, :image, :category_id)
		end

end
