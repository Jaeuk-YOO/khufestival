class HomeController < ApplicationController
  def index
    @posts = Post.all
    @one_post = Post.find(params[:id])
    
    @contents1 = @one_post.contents.where(location:"공대")
    @contents2 = @one_post.contents.where(location:"외대")
    @contents3 = @one_post.contents.where(location:"체대")
    @contents4 = @one_post.contents.where(location:"생대")
    @contents5 = @one_post.contents.where(location:"학생회관")
    
    
  end
  
  def enter
    
  end
  
  def enter_confirm
    @pw = params[:pw]
    if (@pw == 'khulion')
      redirect_to '/home/manage'
    else
      redirect_to :back
    end
  end
  
  def main
    @posts = Post.all
  end
  
  def write
    
    content = Content.new
    content.name = params[:name]
    content.post_id = params[:date]
    
    content.menu1 = params[:menu1]
    content.price1 = params[:price1]
    content.menu2 = params[:menu2]
    content.price2 = params[:price2]
    content.menu3 = params[:menu3]
    content.price3 = params[:price3]
    
    content.location = params[:location]
    content.text = params[:text]
    
    content.save
    
    redirect_to '/home/manage'
    
  end
  
  def manage
    @man_posts = Post.all
  end
  
  def list
    
    @one_post = Post.find(params[:id])
    
  end
  
  def update_view
    @one_content = Content.find(params[:id])
  end
  
  def real_update
    @one_content = Content.find(params[:id])
    @one_content.name = params[:name]
    
    @one_content.menu1 = params[:menu1]
    @one_content.price1 = params[:price1]
    @one_content.menu2 = params[:menu2]
    @one_content.price2 = params[:price2]
    @one_content.menu3 = params[:menu3]
    @one_content.price3 = params[:price3]
    
    @one_content.location = params[:location]
    @one_content.text = params[:text]
    
    @one_content.save
    
    redirect_to '/home/manage'
  end
  
  def destroy
    @one_content = Content.find(params[:id])
    @one_content.destroy
    redirect_to :back
  end
  
end
