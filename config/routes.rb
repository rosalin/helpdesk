Helpdesk::Engine.routes.draw do
  default_url_options :host => "suporte.neemo.com.br"
# Rails.application.routes.draw do
  scope "(:locale)", :locale => /pl|pt|en/ do
    
    
    # Admin only roots
    namespace :admin do
      resources :tickets do
        get :assign, on: :member
      end
      resources :ticket_types
      resources :faqs do
        post :sort, on: :collection
      end
      resources :subscribers
      root :to => "tickets#index"
    end

    resources :faqs, :only => [ :index ]
    resources :tickets, :except => [ :edit, :destroy]
    root :to => "tickets#index"

    
  end
end
