json.array!(@inventarios) do |inventario|
  json.extract! inventario, :id, :id_inventario, :Producto, :Cantidad, :id_empleado
  json.url inventario_url(inventario, format: :json)
end
