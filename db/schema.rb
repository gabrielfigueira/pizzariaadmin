# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170603190319) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "logradouro"
    t.integer  "numero"
    t.string   "bairro"
    t.string   "cep"
    t.string   "cidade"
    t.string   "telefone"
    t.string   "email"
    t.date     "data_sincronizacao"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "comandas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "mesa"
    t.datetime "data_hora_finalizacao"
    t.date     "data_sincronizacao"
    t.decimal  "desconto",              precision: 5, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["cliente_id"], name: "index_comandas_on_cliente_id"
  end

end
