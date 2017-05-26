public class PartTime: Employee{
    
    private var hoursWorked : Int
    private var rate : Int
    
    
    public func setHoursWorked (pHoursWorked:Int){
        self.hoursWorked = pHoursWorked
    }
    
    public func getHoursWorked () -> Int{
        return self.hoursWorked
    }
    
    
    public func setRate (pRate:Int){
        self.rate = pRate
    }
    
    public func getRate () -> Int{
        return self.rate
    }
        
    
    
    override init(){
        
        hoursWorked = 0
        rate = 0
        super.init()
    }
    
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String, hoursWorked :Int, rate:Int, pPV: Vehicle?)
    {
        
        self.hoursWorked = hoursWorked
        self.rate = rate
        super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry, pV: pPV)
    }
    
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String, rate:Int, hoursWorked :Int, pPPlate: String, pPMake: String)
    {
        
        self.hoursWorked = hoursWorked
        self.rate = rate
            super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry, pPlate: pPPlate, pMake: pPMake)
    }
    
    
    public override func calcEarnings() -> Int {
        return(hoursWorked * rate)
    }
    
    public override func displayData(){
        super.displayData()
        print("HoursWorked :\(self.hoursWorked)")
        print("Rate:\(self.rate)")
        
    }
    
    
}
