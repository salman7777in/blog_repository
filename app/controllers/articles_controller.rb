class ArticlesController< ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles= Article.all
        @articles= Article.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @article= Article.new
    end
    
    def create
        #render plain: params[:article].inspect
        @article= Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success]= "Article Created Successfully"
            redirect_to article_path(@article)  
        else
            render "new"
        end
    end
    def show
   
    end
    def update
   
        if @article.update(article_params)
            flash[:success] = "Article was updated"
            redirect_to article_path(@article)
        else
            flash[:success] = "Article was not updated"
            render 'edit'
        end
    end
    def edit
    
    end
    def destroy
        if @article.destroy
            flash[:success]= "artical was deleted"
            redirect_to articles_path
        end
    end


    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
        def set_article
            @article= Article.find(params[:id])
        end
end