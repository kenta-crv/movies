Rails.application.routes.draw do

    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }

    resources :admins, only: [:show]

    root to: 'companies#index' #トップページ

    resources :columns
    resources :entries

    resources :companies do 
      resources :introductions #概要
      resources :larges #上場
      resources :branchs #支店
      resources :histories #沿革
      resources :presidents #代表歴
      resources :businesses #事業内容
      resources :cultures #社風
      resources :recruits #求人
      resources :awards #表彰
      resources :achivements #実績
      resources :reviews #レビュー
      resources :deaths #ブラック
      resources :pressreleases #プレスリリース
      resources :prospects #未来図
      resources :totals #まとめ
    end

    get 'lp' => 'tops#lp'

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
