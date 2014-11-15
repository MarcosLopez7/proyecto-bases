json.array!(@proveedor_paquetes) do |proveedor_paquete|
  json.extract! proveedor_paquete, :id, :id_provedor, :id_paquete
  json.url proveedor_paquete_url(proveedor_paquete, format: :json)
end
