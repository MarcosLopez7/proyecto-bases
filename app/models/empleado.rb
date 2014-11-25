class Empleado < ActiveRecord::Base
	has_many :empleado_clientes
	belongs_to :users
	validates :Nombre, presence: true
	validates :Direccion, presence: true
	validates :Telefono, presence: true
	validates :Puesto, presence: true 
	validates :Nombre, format: { with: /\A[a-zA-Z\s]*\z/, message: "Solo se introducen letras"}
	validates :Telefono, length: { in: 7..10}
	validates :Telefono, numericality: {only_integer: true}
	validates :Puesto, format: { with: /\A[a-zA-Z\s]*\z/, message: "Solo se introducen letras"}
end
