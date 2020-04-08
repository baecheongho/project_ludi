class PreviewController < ApplicationController


  require "zabbixapi"
	require 'erb'
	require 'open-uri'
	require 'rubygems'
	require 'json'

  def index
    @tt_data = history_get()

  end
end
