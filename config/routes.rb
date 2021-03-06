Rails.application.routes.draw do




  scope "(:locale)", locale: /es|en/ do
    resources :articles

    get 'dashboard/index/:id', to: 'dashboard#index', as: 'objetos'

    resources :articles do
      resources :petitions
    end

    resources :categories

    get '/inicio/categoria/:categoria', to: 'inicio#selection', as: 'scategoria'

    get '/inicio/tipo/:tipo', to: 'inicio#selection_tipe', as: 'stipo'

    get 'dashboard/index'
    get 'dashboard/noaprob/:id', to: 'dashboard#noaprob', as: 'noaprobado'
    get 'dashboard/aprob/:id', to: 'dashboard#aprob', as: 'aprobado'
    get 'dashboard/aprobenviado/:id', to: 'dashboard#aprobenviado', as: 'aprobadoEnvio'
     get 'dashboard/aprobencontrado/:id', to: 'dashboard#aprobencontrado', as: 'aprobadoEncontrado'
    get 'articles/index'

    get 'articles/new'

    get 'articles/show'

    get 'articles/edit'

    get 'article/index'

    get 'article/new'

    get 'article/show'

    get 'article/edit'

    resources :petitions

    get 'petitions/encontre/:article_id', to: 'petitions#encontre', as: 'encontre'

    root 'inicio#bienvenido'

    resources :users

    post 'login/iniciar_sesion'
    post 'login/cerrar_sesion'

    get 'login/cerrar_sesion'

    get 'login/iniciar_sesion'

    get 'inicio/bienvenido'

      match 'articles_find', to: 'articles#find', via: [:get, :post]

  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
