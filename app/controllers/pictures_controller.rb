class PicturesController < ApplicationController

before_action :set_picture, only: [:show, :edit, :update, :destroy]

def index
  @pictures = Picture.all

end

def new
  @picture = Picture.new
end

def create
  @picture = current_user.pictures.build(picture_params)
  if params[:back]
    render :new
  else
    if @picture.save
      ReportMailer.report_mail(@picture).deliver
      redirect_to pictures_path, notice: "投稿を作成しました！"
    else
    render :new
    end
  end
end

def show
end

def edit
end

def update
  if @picture.update(picture_params)
    redirect_to pictures_path, notice: "編集しました！"
  else
    render :edit
  end
end

def destroy
  @picture.destroy
  redirect_to pictures_path, notice:"投稿を削除しました！"
end

def confirm
  @picture = current_user.pictures.build(picture_params)
  render :new if @picture.invalid?
end

private

def picture_params
  params.require(:picture).permit(:content, :name, :image, :upload, :upload_cache)
end

def set_picture
  @picture = current_user.pictures.find(params[:id])     
end

end
