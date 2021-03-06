class StaticPagesController < ApplicationController
  layout :theme_name
  
  def home
    if user_signed_in?
      @sites = Site.where(user_id: current_user.id).all
    end
    if request.subdomain != "www" && request.subdomain.present?
      @subdomain           = request.subdomain
      @site                = Site.where(subdomain: request.subdomain).first
      @user                = User.where(id: @site.user_id).first
      @themeoptions        = ThemeOption.where(site_id: @site.id).first
      @pages               = Page.where(site_id: @site.id).all
      @availabilities      = Availability.where(site_id: @site.id).all
      @propertyinformation = PropertyInformation.where(site_id: @site.id).first
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def leasing
    if request.subdomain != "www" && request.subdomain.present?
      @subdomain            = request.subdomain
      @site                 = Site.where(subdomain: request.subdomain).first
      @user                 = User.where(id: @site.user_id).first
      @themeoptions         = ThemeOption.where(site_id: @site.id).first
      @pages                = Page.where(site_id: @site.id).all
      @availabilities       = Availability.where(site_id: @site.id).all
      @propertyinformation  = PropertyInformation.where(site_id: @site.id).first
      
    end
  end

  # Changes theme of front end if subdomain exist and does not equal "www"
  def theme_name
    if request.subdomain != "www" && request.subdomain.present?
      @subdomain = request.subdomain
      @site = Site.where(subdomain: request.subdomain).first
      @user = User.where(id: @site.user_id).first
      @theme_name = ThemeOption.where(site_id: @site.id).first.template
      @theme = ThemeName.where(id: @theme_name).first.name.downcase
      if params[:action] == "home" 
        @theme
      elsif params[:action] == "leasing"
        @theme + "leasing"
      end
    else
      "test"
    end
  end


end
