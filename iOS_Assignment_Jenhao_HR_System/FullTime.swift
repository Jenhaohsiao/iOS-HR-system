public class FullTime: Employee{
    
    private var salary: Int = 0
    private var bonus: Int = 0
    
    
    
    public func setSalary (pSalary:Int){
        self.salary = pSalary
    }
    
    public func getSalary() -> Int{
        return self.salary
    }
    
    public func setBonus (pBonus:Int){
        self.bonus = pBonus
    }
    
    public func getBonus() -> Int{
        return self.bonus
    }
    

    
    // constructor1
    
    override init(){
        super.init()
        salary = 0
        bonus = 0
    }
    // constructor2
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String,  salary:Int, bonus:Int, pPV: Vehicle?)
    {
        super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry, pV: pPV)
        self.salary = salary
        self.bonus = bonus
    }
    // constructor3
    
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String,  salary:Int, bonus:Int, pPPlate: String, pPMake: String)
    {
               super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry,  pPlate:pPPlate, pMake: pPMake)
        self.salary = salary
        self.bonus = bonus
    }
    
    public override func calcEarnings() -> Int {
        return(salary + bonus)
    }
    
    public override func displayData(){
        super.displayData()
        print("Salary:\(self.salary)")
        print("Bonus:\(self.bonus)")

        
    }
    
    
}
