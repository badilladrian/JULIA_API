using HTTP
using Genie

import Genie.Router: route
import Genie.Renderer.Json: json


Genie.config.run_as_server = true

route("/") do
  payload = Dict("data"=> "It's running")
  json(payload)
end

route("/glucose") do
    fqVal = Dict("fpVal"=> 5.0)
    intVal1 = Dict("intVal"=> 3)
    intVal2 = Dict("intVal"=> 1)
    intVal3 = Dict("intVal"=> 3)
    intVal4 = Dict("intVal"=> 2)
    values = [fqVal, intVal1, intVal2, intVal3, intVal4]
    points = [Dict("startTimeNanos"=>1574159699023000000, "endTimeNanos"=>1574159699023000000, "dataTypeName"=> "com.google.blood_glucose", "values"=>values)]
    data = Dict("minStartTimeNs"=>1574159699023000000, "maxEndTimeNs"=>1574159699023000000, "dataSourceId"=>"datasource.dataStreamId", "points"=> points)

    json(data)
end

Genie.startup()
