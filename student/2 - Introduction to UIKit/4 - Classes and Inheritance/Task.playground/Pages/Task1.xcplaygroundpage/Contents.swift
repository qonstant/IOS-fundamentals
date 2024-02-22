//let carsTypes = ["Sedan", "SVV", "Sport"]
//let models = ["Toyota", "Hyundai", "KIA", "Porche"]

let volumesOfSedan = [2.5]
let volumesOfSVV = [3.0, 3.5, 4.0]
let volumesOfSport = [5.5, 6.0, 6.5, 7.0, 7.5, 8.0]

var sales: [String: Int] = ["Sedan": 0, "SVV": 0, "Sport": 0]

let mpc = [12, 15, 20] // Consumption

class Car {
    
    enum CarType: String {
        case sedan = "Sedan"
        case svv = "SVV"
        case sport = "Sport"
    }
    
    enum Model: String {
        case toyota = "Toyota"
        case hyundai = "Hyundai"
        case kia = "KIA"
        case porche = "Porche"
    }
    
    let type: CarType
    let model: Model
    let volume: Double
    let fuelConsumption: Int
    
    init(type: CarType, model: Model, volume: Double, fuelConsumption: Int) {
        self.type = type
        self.model = model
        
        // Volume validation
        switch type {
        case .sedan:
            if !volumesOfSedan.contains(volume) {
                fatalError("Invalid volume for Sedan")
            }
        case .svv:
            if !volumesOfSVV.contains(volume) {
                fatalError("Invalid volume for SVV")
            }
        case .sport:
            if !volumesOfSport.contains(volume) {
                fatalError("Invalid volume for Sport")
            }
        }
        
        // Consumtion validation
        switch type {
        case .sedan, .svv:
            if !mpc.contains(fuelConsumption) {
                fatalError("Invalid fuel consumption for Sedan or SVV")
            }
        case .sport:
            // IDK
            break
        }
        
        self.volume = volume
        self.fuelConsumption = fuelConsumption
    }
    
    func buy() {
            sales[self.type.rawValue] = (sales[self.type.rawValue] ?? 0) + 1
    }
}

let sedanCar = Car(type: .sedan, model: .toyota, volume: 2.5, fuelConsumption: 12)
sedanCar.buy()
print(sales)

let svvCar = Car(type: .svv, model: .hyundai, volume: 3.5, fuelConsumption: 15)
svvCar.buy()
print(sales)

let sportCar = Car(type: .sport, model: .kia, volume: 6.0, fuelConsumption: 20)
sportCar.buy()
print(sales)

Car(type: .sport, model: .toyota, volume: 6.0, fuelConsumption: 20).buy()
print(sales)
