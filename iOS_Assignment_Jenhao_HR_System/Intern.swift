public class Intern: Employee{
    
    private var collegeName : String


    public func setCollegeName (pCollegeName : String){
        self.collegeName  = pCollegeName
    }

    public func getCollegeName  () -> String {
        return self.collegeName
    }


    
    // constructor1
    override init(){
        
        collegeName = ""
        
        super.init()
    }
    // constructor2


    
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String, collegeName :String, pPV: Vehicle?)
    {
        
        self.collegeName = collegeName
        
        super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry, pV: pPV)
    }
    // constructor3
    init(ppName:String, ppAge:Int, ppBirthday: String, ppCountry:String, collegeName :String, pPPlate: String, pPMake: String)
    {
        
        self.collegeName = collegeName
        
        super.init(pNAME: ppName, pAge: ppAge, pBirthday: ppBirthday, pCountry: ppCountry, pPlate: pPPlate, pMake: pPMake)
    }
    
    public override func displayData(){
        super.displayData()
        print("School name:\(self.collegeName)")
        
        
    }
    
    
    
}
