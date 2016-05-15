class HomeController < ApplicationController
  def index
    @posts = Post.all
    @one_post = Post.find(params[:id])
    
    @contents1 = @one_post.contents.where(location:"공대")
    @contents2 = @one_post.contents.where(location:"외대")
    @contents3 = @one_post.contents.where(location:"체대")
    @contents4 = @one_post.contents.where(location:"생대")
    @contents5 = @one_post.contents.where(location:"국제대")
    @contents6 = @one_post.contents.where(location:"자대")
    @contents7 = @one_post.contents.where(location:"학생회관")
    
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
    @count = Content.count
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
    content.pwd = params[:pwd]
    
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
    #비밀번호 확인 작업
    pwd = params[:pwd]
    if (pwd == @one_content.pwd)
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
      
      elsif pwd == 'masterkhulion'
      
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
        
    end  
    redirect_to '/home/manage'
  end
  
  def destroy
    @one_content = Content.find(params[:id])
    @one_content.destroy
    redirect_to :back
  end
  
  def delete
    @one_content = Content.find(params[:id])
  end
  
  def real_delete
    @one_content = Content.find(params[:id])
    pwd = params[:pwd]
    if (pwd == @one_content.pwd)
      @one_content.destroy
      elsif pwd == 'masterkhulion'
      @one_content.destroy
    end
    redirect_to '/home/manage'
  end
  
end
