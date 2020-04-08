class DashboardController < ApplicationController


  require "zabbixapi"
	require 'erb'
	require 'open-uri'
	require 'rubygems'
	require 'json'
  require 'date'
#protect_from_forgery except: :index
  def ajax

      group_ret_name = group_get_name()
      group_ret = group_get()
      @group_ret_val_name = group_ret_name.map {|x| x["name"] }
      @group_ret_val = group_ret_name


  end


  def index

    @time = Time.now.to_s

    group_ret_name = group_get_name()
    group_ret = group_get()
    @group_ret_val_name = group_ret_name.map {|x| x["name"] }
    @group_ret_val = group_ret_name

    #@cjdgh = 'cjdgh'

        #@todo = Todo.new
        #@todos = Todo.all
        #respond_to do |format|
        #  format.html {  }
          #format.json { render json: @todos  }
      #    format.js   {render '_ajax'  }
    #    end


        @problems = problem_get()
    if params[:group_val_name]

        @group_selected_val = params[:group_val_name]

    end


    if params[:selected_host].present?
        @group_val2 = "123123123123123"
    end



  end



  def save_position


  end


end
