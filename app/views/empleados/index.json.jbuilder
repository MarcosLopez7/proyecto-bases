json.array!(@empleados) do |empleado|
  json.extract! empleado, :id, :id_empleado, :Nombre, :Direccion, :Telefono, :Puesto
  json.url empleado_url(empleado, format: :json)
end
