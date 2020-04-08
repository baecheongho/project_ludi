Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


root 'dashboard#index'

get '/', to: 'dashboard#index'
post '/', to: 'dashboard#index'

get '/dashboard', to: 'dashboard#index'
post '/dashboard/', to: 'dashboard#index'


get '/preview', to: 'preview#index'
post '/preview', to: 'preview#index'



###### Event history ######

get '/event_history', to: 'history#index'
post '/event_history', to: 'history#index'

###### Event history ######

get '/register', to: 'register#index'
post '/register', to: 'register#index'

###### threshold infra ######

get '/dashboard/th_infra', to: 'th_infra#index'
post '/dashboard/th_infra', to: 'th_infra#index'

get '/th_infra', to: 'th_infra#index'
post '/th_infra', to: 'th_infra#index'

## AJAX routes ##

get '/ajax', to: 'dashboard#ajax'
post '/ajax', to: 'dashboard#ajax'

get '/index', to: 'dashboard#index'
post '/index', to: 'dashboard#index'
###### threshold database ######

get '/dashboard/th_database', to: 'th_database#index'
post '/dashboard/th_database', to: 'th_database#index'

###### threshold application ######

get '/dashboard/th_app', to: 'th_app#index'
post '/dashboard/th_app', to: 'th_app#index'


##### report ###################
 get '/selectdate' , to: 'report#selectdate'
 get '/report/', to: 'report#index'
 post '/report/', to: 'report#index'

 ##### guide ###################

  get '/guide', to: 'guide#index'
  post '/guide', to: 'guide#index'

 # daily report
  get '/report', to: 'report#index'
  post '/report', to: 'report#index'

# daily report
 get '/dailyrepor', to: 'report#daily_report'
 post '/dailyreport/', to: 'report#daily_report'

# weekly report
 get '/weeklyreport', to: 'report#weekly_report'
 post '/weeklyreport/', to: 'report#weekly_report'

 # monthly report
 get '/monthlyreport', to: 'report#monthly_report'
 post '/monthlyreport/', to: 'report#monthly_report'


end
