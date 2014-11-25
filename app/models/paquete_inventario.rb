class PaqueteInventario < ActiveRecord::Base
	belongs_to :paquetes
	belongs_to :inventarios
end
