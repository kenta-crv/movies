Rails.application.routes.draw do
    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }
    resources :admins, only: [:show]

    root to: 'tops#index' #トップページ

    resources :estimates do
      resource :comments
      collection do
        post :confirm
        post :thanks
      end
    end
    
    resources :contracts do
      collection do
        post :confirm
        post :thanks
      end
    end

    resources :columns
    
    get 'lp' => 'tops#lp'

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
