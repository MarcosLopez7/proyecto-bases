# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141114225012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: true do |t|
    t.integer  "id_cliente"
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Telefono"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empleado_clientes", force: true do |t|
    t.integer  "id_empleado"
    t.integer  "id_cliente"
    t.date     "fecha"
    t.time     "hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empleados", force: true do |t|
    t.integer  "id_empleado"
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Telefono"
    t.string   "Puesto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fiesta", force: true do |t|
    t.integer  "id_fiesta"
    t.date     "fecha"
    t.integer  "id_cliente"
    t.integer  "id_empleado"
    t.integer  "id_paquete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventarios", force: true do |t|
    t.integer  "id_inventario"
    t.string   "Producto"
    t.integer  "Cantidad"
    t.integer  "id_empleado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventarios", ["id_empleado"], name: "index_inventarios_on_id_empleado", using: :btree

  create_table "paquetes", force: true do |t|
    t.integer  "id_paquete"
    t.integer  "Numero_paquete"
    t.integer  "Costo"
    t.text     "Descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proveedor_paquetes", force: true do |t|
    t.integer  "id_provedor"
    t.integer  "id_paquete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proveedors", force: true do |t|
    t.integer  "id_provedor"
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Telefono"
    t.string   "Producto"
    t.integer  "id_empleado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proveedors", ["id_empleado"], name: "index_proveedors_on_id_empleado", using: :btree

end
