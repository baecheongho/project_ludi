class ApplicationController < ActionController::Base

  @treshold_infra_url = "http://222.122.31.111:30000/ludiapm_dashboard/th_infra"
  #$ludiapm_url = "http://222.122.31.111:30000/ludiapm_dashboard/th_infra"

  ## Service Type ##
  ## 0 : Infrastructure only
  ## 1 : Application
  $service_type = "0"

  ### threshold item trigger strings
  $infra_prc_load = "{Active_Linux_general:system.cpu.load[percpu,avg1].avg(5m)}>"
  $infra_prc_count = "{Active_Linux_general:proc.num[,,run].avg(5m)}>"
  $infra_disk_io_overhead = "{Active_Linux_general:system.cpu.util[,iowait].avg(5m)}>"
  $infra_memory_usage = "{Active_Linux_general:vm.memory.size[pused].last(0)}>"

  $cur_time = Time.now
## connect to zabbix api
def zbx_api

  conn_zbx_api = ZabbixApi.connect(
    :url => 'http://demo.ludimore.com/zabbix/api_jsonrpc.php',
    #:user => 
    #:password => 
#  :http_password => 'foo',
#  :http_user => 'bar'
)

## Http Basic Auth

#conn_zbx_api_http = ZabbixApi.connect(
#  :url => 'http://demo.ludimore.com/zabbix/api_jsonrpc.php',
#  :user => 'Admin',
#  :password => 'cjdgh2757',
#  :http_password => 'foo',
#  :http_user => 'bar'
#)

end



def create_host_group(host_group_name)

  hash_value = zbx_api.query(
  :method => "hostgroup.create",
  :params => {
    #:output => ["name","groupids"],
    :name => "#{host_group_name}",

  #  }
  }


)
    return hash_value

end

def create_host(host_name,host_group,ip,port,template)

  hash_value = zbx_api.query(
  :method => "host.create",
  :params => {
    #:output => ["name","groupids"],
    :host => "#{host_name}",
    :groups => [ :groupid => zbx_api.hostgroups.get_id(:name => "#{host_group}") ],
    :interfaces => [
      :type => "1",
      :main => "1",
      :useip => "1",
      :ip => "#{ip}",
      :dns => "",
      :port => "#{port}"
    ],
    :templates => [
      :templateid => "#{template}"
    ]



  #  }
  }


)
    return hash_value

end

def group_get_id()

  group_val = zbx_api.query(
  :method => "hostgroup.get",
  :params => {
    #:output => ["name","groupids"],
    :output => "groupid",
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
    #:filter => {
      #:name => ""
  #  }
  }


)
    #return host_full_data

end


def group_get_name()

  group_val = zbx_api.query(
  :method => "hostgroup.get",
  :params => {#
    #:name => "#{name}",
    :output => ["name"],
    #:output => "groupid",
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "ASC",
    #:sortfield => "groupid",
    #:filter => {
      #:name => ""
  #  }
  }


)
    #return host_full_data

end

def group_get()

  group_val = zbx_api.query(
  :method => "hostgroup.get",
  :params => {
    #:output => ["name","groupid"],
    :output => "extend",
    :monitored_hosts => "true",
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
  #  :selectHosts => ["host"],
  #  :countOutput => "true",
  #  :filter => {
  #    :name => ""
  #  }
  }


)
    #return host_full_data

end

def group_get_hosts(group_name)

  group_val = zbx_api.query(
  :method => "hostgroup.get",
  :params => {
    #:countOutput => "true",
    #:output => ["real_hosts"],

    #:output => "extend",
    #:search => [{:name => "Windows Servers"}],
    :groupids => zbx_api.hostgroups.get_id(:name => "#{group_name}"),
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "name",
    #:sortorder => "ASC",
    #:sortfield => "name",
    #모니터링 중인호스트를 포함 하는 그룹만
    #:monitored_hosts => "true",
    #호스트를 포함한 그룹만
    #:real_hosts => "true",
    #:with_hosts_and_templates => "true",
    #:selectHosts => ["host"],

  #  :filter => {
  #    :name => ""
  #  }
  }


)
    #return host_full_data

end

def host_get()

  hash_val = zbx_api.query(
  :method => "host.get",
  :params => {
    #:output => ["extend"],
    #:groupids => "#{groupids}"
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
    #:filter => {
      #:name => ""
  #  }
  :selectInterfaces => ["ip"]
  }


)
    return hash_val

end

def host_get_by_groupid(groupids)

  host_val = zbx_api.query(
  :method => "host.get",
  :params => {
    :output => ["name"],
    :groupids => "#{groupids}"
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
    #:filter => {
      #:name => ""
  #  }
  }


)
    #return host_full_data

end

def host_get_by_group_name(group_name)

  hash_val = zbx_api.query(
  :method => "host.get",
  :params => {
    :countOutput => "true",
    #:output => ["name"],
    :groupids => zbx_api.hostgroups.get_id(:name => "#{group_name}"),
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
    #:filter => {
      #:name => ""
  #  }
  }


)
    return hash_val

end

def template_get(template_name)

  host_val = zbx_api.query(
  :method => "template.get",
  :params => {
    :output => "extend",
    #limit => "#{tar_limit}",
    #:softfield => "clock",
    #:sortfield => "clock",
    #:sortorder => "DESC",
    #:sortfield => "name",
    :filter => {
      :host => "#{template_name}"
    }
  }


)
    #return host_full_data

end


def event_get()

    event_get_val = zbx_api.query(
    :method => "event.get",
    :params => {
    :output => "extend",

    #:history => ["3"],
    #:hostids => ["10084"],
    #:itemids => ["23312"],
    #:itemids => ["23307"],
    #:itemids => ["31581"],
    #:itemids => ["31909"],
  #  :time_from => ["1578388399"],
  #  :time_till => ["1578388400"],

    #:hostids => ["#{hostids}"],
    #:itemids => ["#{itemids}"],
    :softfield => "clock",
    :softfield => "value",
    :softorder => "eventid",
#    :limit => ["10"],
  #:time_from => ["#{time_from}"],
  :time_from => "1581302104",
  :time_till => "1581388439"
#    :time_till => ["#{time_till}"],

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],
}

)
end


def get_chart_data(hostids,itemids,datatype,limit)

    latest_get_val = zbx_api.query(
  :method => "history.get",
  :params => {
    #:output => "extend",
    :history => "#{datatype}",
    #:hostids => "#{hostids}",
    #:itemids => "#{itemids}",

  #  :time_from => ["1578388399"],
  #  :time_till => ["1578388400"],

    #:hostids => ["#{hostids}"],
    #:itemids => ["#{itemids}"],
    :limit => "1",
    #:softfield => "clock",
    :sortfield => "clock",
    :sortorder => "DESC"

#  :time_from => ["#{time_from}"],
#    :time_till => ["#{time_till}"],

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],
}
)

return latest_get_val
end

def event_get_by_time(date_from,date_to)

  hash_val = zbx_api.query(
    :method => "event.get",
    :params => {
        #:recent => "true",
        :sortfield => ["eventid","clock"],
        :sortorder => "DESC",
#:templated => true,
#:output => "extend",
#:filter => {
              #:value => "1",
            #},
            :time_from => "#{date_from}",
            :time_till => "#{date_to}",
            :selectHosts => ["host"],
            #:selectRelatedObject => "true",
#:limit => "50"
#]
        }
)
  return hash_val


end
#def history_get(hostids,itemids,time_from,time_till)
#def history_get(hostids,itemids)
def latest_trigger()

  latest_triggers = zbx_api.query(
    :method => "event.get",
    :params => {
        #:recent => "true",
        :sortfield => ["eventid","clock"],
        :sortorder => "DESC",
#:templated => true,
#:output => "extend",
#:filter => {
              #:value => "1",
            #},
            :selectHosts => ["host"],
            #:selectRelatedObject => "true",
:limit => "50"
#]
        }
)
  return latest_triggers


end

def problem_get()

  problems = zbx_api.query(
    :method => "problem.get",
    :params => {
        :recent => "true",
        :sortfield => ["eventid"],
        :sortorder => "DESC",
#:templated => true,
#:output => "extend",
#:filter => {
#              :value => "0",
#            },
            :selectHosts => ["host"],
            #:selectRelatedObject => "true",
:limit => "500",
:recent => "true"
#]
        }
)

  return problems

end

def get_host_by_eventid()

  problems = zbx_api.query(
    :method => "event.get",
    :params => {
        :recent => "true",
        :sortfield => ["eventid","clock"],
        :sortorder => "DESC",
#:templated => true,
#:output => "extend",
#:filter => {
#              :value => "0",
#            },
            :selectHosts => ["host"],
            #:selectRelatedObject => "true",
#:limit => "500",

#]
        }
)

  return problems

end


def history_get()

    history_get_val = zbx_api.query(
  :method => "history.get",
  :params => {
    #:output => ["extend"],
    :history => 0,
    #:hostids => ["10084"],
    #:itemids => ["23312"],
    #:itemids => ["23307"],
    :itemids => "31581",
    #:itemids => ["31909"],
  #  :time_from => ["1578388399"],
  #  :time_till => ["1578388400"],

    #:hostids => ["#{hostids}"],
    #:itemids => ["#{itemids}"],
    :limit => 20,
    #:softfield => "clock",
    #:softfield => "value",
    #:softorder => "DESC"

#  :time_from => ["#{time_from}"],
#    :time_till => ["#{time_till}"],

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],
}
)
end


def trigger_get_lastchanges()

 view_trigger_val = zbx_api.query(
  :method => "trigger.get",
  :params => {
#       :sortfield => {
#       :description => "trigg3",
#       :tag => "kkkk",
#       :tags => "kkkk",
#       :triggerids => "trrqwre",
#},
    #   :triggerids => "#{arg1}",

    #:filter => ["value": "1"],
    :softfield => "lastchange",
    :limit => 1
    #:output => ["lastchange"]

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],



	#:selectTags => "infra_prc_load",
	#:triggerids => ["#{target_val}"]
}
)

 return view_trigger_val

end

def view_trigger_status(target_trig_id)

    view_trigger_val = zbx_api.query(
  :method => "trigger.get",
  :params => {
#       :sortfield => {
#       :description => "trigg3",
#       :tag => "kkkk",
#       :tags => "kkkk",
#       :triggerids => "trrqwre",
#},
    #   :triggerids => "#{arg1}",

    :output => "status",

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],



  #:selectTags => "infra_prc_load",
  :triggerids => "#{target_trig_id}"
}
)
end



def view_trigger_name(target_trig_id)

 view_trigger_name_val = zbx_api.query(
  :method => "trigger.get",
  :params => {
#       :sortfield => {
#       :description => "trigg3",
#       :tag => "kkkk",
#       :tags => "kkkk",
#       :triggerids => "trrqwre",
#},
    #   :triggerids => "#{arg1}",

    :output => "description",

    #:filter => {
    #  :value => "expression"
     #:description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],



  #:selectTags => "infra_prc_load",
  :triggerids => "#{target_trig_id}"
}
)

 return view_trigger_name_val

end

def view_trigger(target_val)

 view_trigger_val = zbx_api.query(
  :method => "trigger.get",
  :params => {
#       :sortfield => {
#       :description => "trigg3",
#       :tag => "kkkk",
#       :tags => "kkkk",
#       :triggerids => "trrqwre",
#},
    #   :triggerids => "#{arg1}",

    :output => "expression",

    #:filter => {
    #  :value => "expression"
     # :description => "",
    #},
#    :search => "16899",
#    :sortorder => '16899',
    #:templated => true,
    #:search => [{:filter => "expression"}],



	#:selectTags => "infra_prc_load",
	:triggerids => "#{target_val}"
}
)

 return view_trigger_val

end


def get_trigger_id(trig_name)

  get_trigger_id_val = zbx_api.query(
    :method => "trigger.get",
    :params => {
#       :sortfield => {
#       :description => "trigg3",
#       :tag => "kkkk",
#       :tags => "kkkk",
#       :triggerids => "trrqwre",
#},
#       :triggerids => "16879",
#    :filter => {
#      :url => "",
#      :description => "trigg3",
#    },
#    :search => "16899",
#    :sortorder => '16899',
:templated => true,
:output => "triggerid",
:tags => [
 { :tag => "#{trig_name}"
}


]
}
)
  return get_trigger_id_val


end


def update_trigger(trig_id,target_val,update_val)

  update_trigger_val = zbx_api.query(

    :method => "trigger.update",
    :params => {
#  :description => "trigg4",
    :triggerid => "#{trig_id}",
    :expression => "#{target_val}#{update_val}",
  #:expression => "{Active_Linux_general:system.cpu.load[percpu,avg1].avg(5m)}>7",
 # :expression => "{Active_Linux_general:system.cpu.load[percpu,avg1].avg(5m)}>7",

  #:expression => "",
  #:comments => "la is faulty (disaster)",
   # :priority => 5,
    #:status     => "#{status_val}",
   # :status     => "0",
#  :hostid => zbx.templates.get_id(:host => "template"),
#  :type => 0,
#    :filter => {
#      :url => "",
    #},
    :templated => true,
    :output => "extend"
  }

  )
  redirect_back(fallback_location: root_path)




end

def update_trigger_status(trig_id,status_val)

  update_trigger_val = zbx_api.query(

    :method => "trigger.update",
    :params => {
#  :description => "trigg4",
    :triggerid => "#{trig_id}",
  #:comments => "la is faulty (disaster)",
  #  :priority => 5,
    :status     => "#{status_val}",
   # :status     => "0",
#  :hostid => zbx.templates.get_id(:host => "template"),
#  :type => 0,
#    :filter => {
#      :url => "",
    #},
    :templated => true,
    :output => "extend"
  }

  )
  redirect_back(fallback_location: root_path)




end


end
