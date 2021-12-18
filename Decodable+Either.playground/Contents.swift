import Foundation

let json = """
[
    {
        "type": "car",
        "identifier": "12345",
        "model": "Audi"
    },
    {
        "type": "Motorcyle",
        "brand": "Yamaha"
    }
]
""".data(using: .utf8)!

let decoder = JSONDecoder()
let vehicles = try! decoder.decode([Either<Car, Motorcycle>].self, from: json)

for vehicle in vehicles {
    switch vehicle {
    case .left(let car):
        print(car.model)
    case .right(let motorcycle):
        print(motorcycle.brand)
    }
}
