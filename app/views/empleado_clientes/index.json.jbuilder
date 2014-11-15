json.array!(@empleado_clientes) do |empleado_cliente|
  json.extract! empleado_cliente, :id, :id_empleado, :id_cliente, :fecha, :hora
  json.url empleado_cliente_url(empleado_cliente, format: :json)
end
