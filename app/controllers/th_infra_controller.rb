class ThInfraController < ApplicationController
	#skip_before_action :verify_authenticity_token
	require "zabbixapi"
	require 'erb'
	require 'open-uri'
	require 'rubygems'
	require 'json'

	def upanel
		@time = Time.now.to_s
	end

	def index

		@lastest_data = latest_get(1)
@time = Time.now.to_s
		# test chartjs
  #(hostids,itemids,time_from,time_till)

#@test_data = history_get()

#tt_data = history_get()
#@test_data = tt_data.to_s



	#process_count

	#get trig id by trigger tags name
	ret_val = get_trigger_id("infra_prc_count")

	#chagne the trig id integer to string
	ret_val_str = ret_val.to_s
	@infra_prc_count_trig_id = ret_val_str.scan(/\d+/).first

	#get status
	ret_view_status = view_trigger_status("#{@infra_prc_count_trig_id}")
	ret_view_status_str = ret_view_status.to_s
	@result_view_status_prc_count = ret_view_status_str.scan(/\d+/)[1]


	#view trigger by trigger id
	ret_view_val = view_trigger("#{@infra_prc_count_trig_id}")
	#change the trigger value integer to string
	ret_view_val_str = ret_view_val.to_s
	@result_val_prc_count = ret_view_val_str.scan(/\d+/)[2]
#            @text_test = puts texts[r6..20]

	# get trigger name by trig id
	trigger_name_prc_count = view_trigger_name("#{@infra_prc_count_trig_id}")
	trigger_name_prc_count_str = trigger_name_prc_count.to_s
	# delete special charactor from return value
	del_spc_prc_count = trigger_name_prc_count_str.gsub!(/[^0-9A-Za-z]/, ' ')
	@ret_val_trigger_name_prc_count = trigger_name_prc_count_str.scan(/(?<=description).*[a-zA-Z0-9]/)



if params[:prc_count].present?
	@prc_count_target_val = params[:prc_count]
	update_trigger(@infra_prc_count_trig_id,$infra_prc_count,@prc_count_target_val)

end

if params[:prc_count_status].present?
	@prc_count_status_target_val = params[:prc_count_status]
		#out_file = File.new("out.txt", "w")
#...
#out_file.puts("#{@prc_count_status_target_val}")
#...
#out_file.close

case @prc_count_status_target_val
		#case @ttt

	when "on"

		update_trigger_status(@infra_prc_count_trig_id,"1")
		@prc_count_status_target_val = ""

	when "off"


		update_trigger_status(@infra_prc_count_trig_id,"0")
		@prc_count_status_target_val = ""
	end


end

#process_load

	#get trig id by trigger tags name
	ret_val = get_trigger_id("infra_prc_load")

	#chagne the trig id integer to string
	ret_val_str = ret_val.to_s
	@infra_prc_load_trig_id = ret_val_str.scan(/\d+/).first

	#get status
	ret_view_status = view_trigger_status("#{@infra_prc_load_trig_id}")
	ret_view_status_str = ret_view_status.to_s
	@result_view_status_prc_load = ret_view_status_str.scan(/\d+/)[1]


	#view trigger by trigger id
	ret_view_val = view_trigger("#{@infra_prc_load_trig_id}")
	#change the trigger value integer to string
	ret_view_val_str = ret_view_val.to_s
	@result_val_prc_load = ret_view_val_str.scan(/\d+/)[2]
#            @text_test = puts texts[r6..20]

	# get trigger name by trig id
	trigger_name_prc_load = view_trigger_name("#{@infra_prc_load_trig_id}")
	trigger_name_prc_load_str = trigger_name_prc_load.to_s
	# delete special charactor from return value
	del_spc_prc_load = trigger_name_prc_load_str.gsub!(/[^0-9A-Za-z]/, ' ')
	@ret_val_trigger_name_prc_load = trigger_name_prc_load_str.scan(/(?<=description).*[a-zA-Z0-9]/)



if params[:prc_load].present?
	@prc_load_target_val = params[:prc_load]
	update_trigger(@infra_prc_load_trig_id,$infra_prc_load,@prc_load_target_val)

end

if params[:prc_load_status].present?
	@prc_load_status_target_val = params[:prc_load_status]
		#out_file = File.new("out.txt", "w")
#...
#out_file.puts("#{@prc_load_status_target_val}")
#...
#out_file.close

case @prc_load_status_target_val
		#case @ttt

	when "on"

		update_trigger_status(@infra_prc_load_trig_id,"1")
		@prc_load_status_target_val = ""

	when "off"


		update_trigger_status(@infra_prc_load_trig_id,"0")
		@prc_load_status_target_val = ""
	end
end

#Disk_I/O overhead

	#get trig id by trigger tags name
	ret_val = get_trigger_id("infra_disk_io_overhead")

	#chagne the trig id integer to string
	ret_val_str = ret_val.to_s
	@infra_disk_io_overhead_trig_id = ret_val_str.scan(/\d+/).first

	#get status
	ret_view_status = view_trigger_status("#{@infra_disk_io_overhead_trig_id}")
	ret_view_status_str = ret_view_status.to_s
	@result_view_status_disk_io_overhead = ret_view_status_str.scan(/\d+/)[1]


	#view trigger by trigger id
	ret_view_val = view_trigger("#{@infra_disk_io_overhead_trig_id}")
	#change the trigger value integer to string
	ret_view_val_str = ret_view_val.to_s
	@result_val_disk_io_overhead = ret_view_val_str.scan(/\d+/)[2]
#            @text_test = puts texts[r6..20]

	# get trigger name by trig id
	trigger_name_disk_io_overhead = view_trigger_name("#{@infra_disk_io_overhead_trig_id}")
	trigger_name_disk_io_overhead_str = trigger_name_disk_io_overhead.to_s
	# delete special charactor from return value
	del_spc_disk_io_overhead = trigger_name_disk_io_overhead_str.gsub!(/[^0-9A-Za-z]/, ' ')
	@ret_val_trigger_name_disk_io_overhead = trigger_name_disk_io_overhead_str.scan(/(?<=description).*[a-zA-Z0-9]/)




if params[:disk_io_overhead].present?
	@disk_io_overhead_target_val = params[:disk_io_overhead]
	update_trigger(@infra_disk_io_overhead_trig_id,$infra_disk_io_overhead,@disk_io_overhead_target_val)

end

if params[:disk_io_overhead_status].present?
	@disk_io_overhead_status_target_val = params[:disk_io_overhead_status]
		#out_file = File.new("out.txt", "w")
#...
#out_file.puts("#{@disk_io_overhead_status_target_val}")
#...
#out_file.close

case @disk_io_overhead_status_target_val
		#case @ttt

	when "on"

		update_trigger_status(@infra_disk_io_overhead_trig_id,"1")
		@disk_io_overhead_status_target_val = ""

	when "off"


		update_trigger_status(@infra_disk_io_overhead_trig_id,"0")
		@disk_io_overhead_status_target_val = ""
	end
end

#Memory_usage

	#get trig id by trigger tags name
	ret_val = get_trigger_id("infra_memory_usage")

	#chagne the trig id integer to string
	ret_val_str = ret_val.to_s
	@infra_memory_usage_trig_id = ret_val_str.scan(/\d+/).first

	#get status
	ret_view_status = view_trigger_status("#{@infra_memory_usage_trig_id}")
	ret_view_status_str = ret_view_status.to_s
	@result_view_status_memory_usage = ret_view_status_str.scan(/\d+/)[1]


	#view trigger by trigger id
	ret_view_val = view_trigger("#{@infra_memory_usage_trig_id}")
	#change the trigger value integer to string
	ret_view_val_str = ret_view_val.to_s
	@result_val_memory_usage = ret_view_val_str.scan(/\d+/)[2]
#            @text_test = puts texts[r6..20]

	# get trigger name by trig id
	trigger_name_memory_usage = view_trigger_name("#{@infra_memory_usage_trig_id}")
	trigger_name_memory_usage_str = trigger_name_memory_usage.to_s
	# delete special charactor from return value
	del_spc_memory_usage = trigger_name_memory_usage_str.gsub!(/[^0-9A-Za-z]/, ' ')
	@ret_val_trigger_name_memory_usage = trigger_name_memory_usage_str.scan(/(?<=description).*[a-zA-Z0-9]/)



if params[:memory_usage].present?
	@memory_usage_target_val = params[:memory_usage]
	update_trigger(@infra_memory_usage_trig_id,$infra_memory_usage,@memory_usage_target_val)

end

if params[:memory_usage_status].present?
	@memory_usage_status_target_val = params[:memory_usage_status]
		#out_file = File.new("out.txt", "w")
#...
#out_file.puts("#{@memory_usage_status_target_val}")
#...
#out_file.close

case @memory_usage_status_target_val
		#case @ttt

	when "on"

		update_trigger_status(@infra_memory_usage_trig_id,"1")
		@memory_usage_status_target_val = ""

	when "off"


		update_trigger_status(@infra_memory_usage_trig_id,"0")
		@memory_usage_status_target_val = ""
	end
end




end





end
