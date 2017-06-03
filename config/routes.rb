Rails.application.routes.draw do

  root 'dashboard#index'

  resources :comandas
  resources :clientes
  namespace :api do
    # Api dos clientes
    post 'clientes/salvar', to: 'clientes#salvar', as: 'salvar_cliente'
    post 'clientes/excluir', to: 'clientes#excluir', as: 'excluir_cliente'

    # Api das comandas
    post 'comandas/salvar', to: 'comandas#salvar', as: 'salvar_comanda'
    post 'comandas/excluir', to: 'comandas#excluir', as: 'excluir_comanda'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
