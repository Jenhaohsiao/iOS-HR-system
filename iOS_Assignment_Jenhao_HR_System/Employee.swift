public class Employee : IDisplayable {
    private var name : String
    private var age : Int
    private var birthday : String
    private var country: String
    
    public var vehicle_owned : Vehicle?
    
    
    //setter and getter
    public func setName (pName:String){
        self.name = pName
    }
    
    public func getName() -> String{
        return self.name
    }
    
    
    public func setAge (pAge:Int){
        
        if pAge > 0 {
            self.age = pAge
        }else{
            print("Invalid Age, Age has > 0 ")
        }
    }
    
    public func getAge() -> Int{
        return self.age
    }

    public func setBirthday (pBirthday: String){
        self.birthday = pBirthday
    }

    public func getBirthday () -> String {
        return self.birthday
    }

    public func setCountry (pCountry: String){
        self.country = pCountry
    }

    public func getCountry () -> String {
        return self.country
    }




    
    
    
    //initializer
    init(){
        name = ""
        age = 0
        birthday = ""
        country = ""
        vehicle_owned = nil

    }
    
    
    
    init( pNAME: String, pAge: Int, pBirthday: String, pCountry:String, pV:Vehicle?){
        self.name = pNAME
        self.age = pAge
        self.birthday = pBirthday
        self.country = pCountry
        self.vehicle_owned = pV
    }
    
    init( pNAME: String, pAge: Int, pBirthday: String, pCountry:String, pPlate: String, pMake : String){
        self.name = pNAME
        self.age = pAge
        self.birthday = pBirthday
        self.country = pCountry
        self.vehicle_owned = Vehicle(pPlate: pPlate, pMake: pMake)
    }
    
    
    public func CalcBirthYear() -> Int{
        return (2016 - self.age)
        
    }
    
    public func calcEarnings() -> Int {
        return 1000
    }
    
    public func displayData(){
        print("Name:\(self.name)")
        print("Age:\(self.age)")
        print("Birthday:\(self.birthday)")
        print("Country:\(self.country)")
        if vehicle_owned != nil{
            vehicle_owned?.displayData()
        }else{
            print ("NO Vehicle")
        }
        
    }
    
    
    
    
}
