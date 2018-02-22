Rails.application.routes.draw do

  get 'start/about'

#ログイン後個人の詳細画面を表示
  # root 'users#show'

  # get 'users/show'

  devise_for :users

  root 'start#top'
  resources :books

#usersコントローラにはshowアクションしか定義していないため
#onlyを使って不必要なルーティングが生成されるのを制限する。が、今回色々作るから外す
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
