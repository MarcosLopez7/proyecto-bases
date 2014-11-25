json.array!(@paquete_inventarios) do |paquete_inventario|
  json.extract! paquete_inventario, :id, :id_inventario, :id_paquete
  json.url paquete_inventario_url(paquete_inventario, format: :json)
end
