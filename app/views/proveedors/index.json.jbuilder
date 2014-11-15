json.array!(@proveedors) do |proveedor|
  json.extract! proveedor, :id, :id_provedor, :Nombre, :Direccion, :Telefono, :Producto, :id_empleado
  json.url proveedor_url(proveedor, format: :json)
end
