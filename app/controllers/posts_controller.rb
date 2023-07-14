class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    if @post.save
      puts "保存に成功しました"
          flash[:notion] = "作品登録完了"
      redirect_to :posts # ＠displayとすることでDBから取得したデータを指定すると、そのコントローラーのshowアクションに該当するページに遷移する。「redirect_to パラメータ」
  else
    render "posts/new"

  end
  end

  def show
    @post = Post.find(params[:id])

  end
private
 def post_params
    params.require(:post).permit(:post_name,:introduction,:image)
 end
end

