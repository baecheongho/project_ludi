class RegisterController < ApplicationController

    require "zabbixapi"
  	require 'erb'
  	require 'open-uri'
  	require 'rubygems'
  	require 'json'
    require 'date'


    def index

      infra_linux_template_val = template_get("INFRA_Active_Linux_general")
      infra_linux_template_id_str = infra_linux_template_val.map {|x| x["templateid"] }
      infra_linux_template_id = infra_linux_template_id_str[0]
      @all_hosts2 = host_get()
      @hash_ = {}
      all_groups = group_get()
      @all_groups_name = all_groups.map {|x| x["name"] }
      #@all_groups_hosts = group_get_hosts('Networking Hardware')

              #@hos = t.select{|x| x["host"]}
              #hosts = 1
            #  @hosts = t
              #@hosts = hosts.map {|x| x["name"] }

            #scan(/(?<=host":").*[a-zA-Z0-9]/)
      #  @all_groups_name.each do |t|
      #    @all_groups_hosts = group_get_hosts(t)
      #  end
    #end
      @all_hosts = host_get()
      @all_groups_hash = group_get()
      #@hosts_count = host_get_by_group_name("Users")


      # Create Hostgroup and Host
      if params[:create_group].present?

          create_host_group(params[:create_group])

      end

      if params[:create_host_name].present?

        if $service_type == "0"

          create_host(params[:create_host_name],params[:create_host_group],params[:create_ip],params[:create_port],infra_linux_template_id)

        end


      end

    end
    # End Host create

end
