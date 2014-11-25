class Cliente < ActiveRecord::Base
	has_many :fiesta
	has_many :empleado_clientes
	validates :Nombre, presence: true
	validates :Direccion, presence: true
	validates :Telefono, presence: true
	validates :email, presence: true 
	validates :Nombre, format: { with: /\A[a-zA-Z\s]*\z/, message: "Solo se introducen letras"}
	validates :Telefono, length: { in: 7..10}
	validates :Telefono, numericality: {only_integer: true}
end
