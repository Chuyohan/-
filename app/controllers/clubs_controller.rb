class ClubsController < ApplicationController
  def new
  	@club = Club.new
    @album = @club.albums.build
  end
  
  def create
    @club = Club.new(club_params)
    if @club.save
      unless params[:albums].nil?
        params[:albums]['image'].each do |a|
          @album = @club.albums.create!(image: a, club_id: @club.id)
        end
      end
      redirect_to all_show_path
    else
      render 'new'
    end
  end

  def edit
  	@club = Club.find(params[:id])
  end

  def update
  	@club = Club.find(params[:id])
    if @club.update_attributes(club_params)
        unless params[:albums].nil?
          @club.albums.each do | a | 
           a.destroy
          end
          params[:albums]['image'].each do |a|
            @album = @club.albums.create!(image: a, club_id: @club.id)
          end
        end
  		flash.now[:success] = "Club Post Eidt Success"
  		redirect_to all_show_path
  	else
  		render 'edit'
  	end
  end
 
  def view
  	@club = Club.find(params[:id])
    @albums = @club.albums.all
  end 

  def delete
  	Club.find(params[:id]).destroy
  	flash[:success] = "Club deleted"
  	redirect_to all_show_path
  end

  def all_show
    @clubs = Club.all.order("RANDOM()").paginate(page: params[:page]).per_page(9)
    respond_to do |format|
      format.js 
      format.html # index.html.erb
    end
  end

  def category_show
	case params[:category]
      when "연극"
        @category = "연극"
      when "문화"
        @category = "문화"
      when "체육"
        @category = "체육"
      when "학술"
        @category = "학술"
      when "봉사"
        @category = "봉사"
      when "종교"
        @category = "종교"
    end
    @clubs = Club.where(category: @category).paginate(page: params[:page], per_page: 9)
  end

  def favorite_show
    @clubs = current_user.favorite.paginate(page: params[:page], per_page: 9)
  end

  private
    def club_params
      params.require(:club).permit(:name, :category, :intro, :location, :personnel, :history, :phone, :picture, albums:[:image, :club_id])
  	end
end
