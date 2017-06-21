Rails.application.routes.draw do

  resources :produtos
  root 'dashboard#index'
  mount ExceptionLogger::Engine => "/logs"
  resources :comandas
  resources :clientes
  namespace :api do
    # Rota da documentação
    get 'docs', to: 'docs#index', as: 'docs'
    # Api dos clientes
    post 'clientes/salvar', to: 'clientes#salvar', as: 'salvar_cliente'
    post 'clientes/excluir', to: 'clientes#excluir', as: 'excluir_cliente'

    # Api das comandas
    post 'comandas/salvar', to: 'comandas#salvar', as: 'salvar_comanda'
    post 'comandas/excluir', to: 'comandas#excluir', as: 'excluir_comanda'

    # Api das Produtos
    post 'produtos/salvar', to: 'produtos#salvar', as: 'salvar_produto'
    post 'produtos/excluir', to: 'produtos#excluir', as: 'excluir_produto'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
