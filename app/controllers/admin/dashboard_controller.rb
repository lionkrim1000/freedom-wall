# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin! # Ensure only admins can access this
  
    def index
      @rants = Rant.all
      @confessions = Confession.all
      @casual_posts = CasualPost.all
    end
  end
