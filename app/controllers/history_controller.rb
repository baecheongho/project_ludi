class HistoryController < ApplicationController

require 'builder'
require "zabbixapi"
require 'erb'
require 'open-uri'
require 'rubygems'
require 'json'
require 'date'


  def index

    # Date and Time selector

      Time.zone = 'Asia/Seoul'
      time_now = Time.zone.now
      one_hour_ago = 1.hour.ago
      one_day_ago = 1.day.ago
      one_week_ago = 1.week.ago
      one_month_ago = 1.month.ago
      one_year_ago = 1.year.ago
      @one_hour_ago_view = one_hour_ago

    # Conver to unix time
      unixt_time_now = time_now.to_i
      unixt_one_hour_ago = one_hour_ago.to_i
      unixt_one_day_ago = one_day_ago.to_i
      unixt_one_week_ago = one_week_ago.to_i
      unixt_one_month_ago = one_month_ago.to_i
      unixt_one_year_ago = one_year_ago.to_i
      seoul = unixt_one_year_ago
      @seoul = Time.at(seoul)


     if params[:date_from].present? && params[:date_to].present?

       @date_from_unixt_str = params[:date_from]
       date_from_unixt_int = DateTime.parse(@date_from_unixt_str).to_i
       @date_to_unixt_str = params[:date_to]
       date_to_unixt_int = DateTime.parse(@date_to_unixt_str).to_i

       @event_history = event_get_by_time(date_from_unixt_int,date_to_unixt_int)

     else

       @date_from_unixt_str = one_hour_ago
       @date_to_unixt_str = time_now
       @event_history = event_get_by_time(unixt_one_hour_ago,unixt_time_now)


     end


      @two_hours_ago = DateTime.now - (2.0/24)

  end

    def TimeControl



    end



end
