json.array!(@paquetes) do |paquete|
  json.extract! paquete, :id, :id_paquete, :Numero_paquete, :Costo, :Descripcion
  json.url paquete_url(paquete, format: :json)
end
