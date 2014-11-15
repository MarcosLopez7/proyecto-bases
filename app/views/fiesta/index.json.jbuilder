json.array!(@fiesta) do |fiestum|
  json.extract! fiestum, :id, :id_fiesta, :fecha, :id_cliente, :id_empleado, :id_paquete
  json.url fiestum_url(fiestum, format: :json)
end
