public class Vehicle : IDisplayable{
    
    private var plateNumber : String
    private var make : String
    
    public func setPlateNumber (pPlateNumber : String){
        self.plateNumber  = pPlateNumber
    }
    
    public func getPlateNumber  () -> String {
        return self.plateNumber
    }
    
    public func setMake (pMake : String){
        self.make  = pMake
    }
    
    public func getMake  () -> String {
        return self.make
    }


    
    
    init(){
        plateNumber = ""
        make = ""
    }
    
    init(pPlate : String, pMake: String){
        plateNumber = pPlate
        make = pMake
    }
    
    public func displayData() {
        print("Vehicle Make \(self.make)")
        print("Vehicle Plate \(self.plateNumber)")
        
    }
}

