json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :id_cliente, :Nombre, :Direccion, :Telefono, :email
  json.url cliente_url(cliente, format: :json)
end
