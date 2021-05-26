class PrototypesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :update, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
  if @prototype.save
      redirect_to action: :index
  else
    render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    if current_user != @prototype.user  #ログインユーザーとプロトタイプ投稿者が違う場合
       redirect_to root_path   #top-page-pathトップページに行く。
    end
  end


  def update
    if @prototype.update(prototype_params)
       redirect_to prototype_path(@prototype.id)
  else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy!
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


  # ログインユーザーが編集しようとしている投稿の投稿者と違ったら
  # ルートパスに飛ばしたい
end