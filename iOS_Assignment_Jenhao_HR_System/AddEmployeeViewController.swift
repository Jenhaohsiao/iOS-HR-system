//
//  AddEmployeeViewController.swift
//  iOS_Assignment_Jenhao_HR_System
//
//  Created by HSIAO JENHAO on 2016-11-27.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit


//var arrEmployeeList : [Employee] = [Employee]()


class AddEmployeeViewController: UIViewController ,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {


    //    var modifyDelegete: IModify?


    @IBOutlet weak var LabelNameForChange: UILabel!

    @IBOutlet weak var OutletType: UISegmentedControl!

    @IBOutlet weak var LabelName: UILabel!

    @IBOutlet weak var TextFieldName: UITextField!


    @IBOutlet weak var LabelShowAge: UILabel!


    @IBOutlet weak var ToolbarBirthDay: UIToolbar!

    @IBOutlet weak var DatePickerBirthDay: UIDatePicker!


    @IBOutlet weak var ToolbarCountry: UIToolbar!

    @IBOutlet weak var PickerCountry: UIPickerView!


    @IBOutlet weak var LabelItem01: UILabel!

    @IBOutlet weak var LabelItem02: UILabel!

    @IBOutlet weak var TextFildItem01: UITextField!

    @IBOutlet weak var TextFildItem02: UITextField!

    @IBOutlet weak var SwitchVehicleShow: UISwitch!

    @IBOutlet weak var LabelVehicleYesNo: UILabel!

    @IBOutlet weak var LabelMake: UILabel!

    @IBOutlet weak var LabelPlate: UILabel!

    @IBOutlet weak var TextFildMake: UITextField!

    @IBOutlet weak var TextFildPlate: UITextField!

    @IBOutlet weak var BirthDaySelectAndShow: UIButton!


    @IBOutlet weak var CountryShow: UIButton!




    private let characterNames = [
        "Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands", "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova, Republic of", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain", "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Taiwan", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe"]




    //        var delegate:AddViewControllerDelegate?
    //research on convenience constructor


    var employeeEditArrary : [Employee] = []

    var currentEmployee :Employee? = nil

    var segueIndexForEdit : Int? = nil
    var segueIndexForEditFilter : Int? = nil



    var LableCountryName : String = ""
    var LableBirthday :String = ""





    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.



        // Set up views if editing an existing Employee.


        if segueIndexForEdit != nil {

            employeeEditArrary = arrEmployeeList

            LabelNameForChange.text = String(employeeEditArrary[segueIndexForEdit!].getName())


            TextFieldName.text = String(employeeEditArrary[segueIndexForEdit!].getName())

            TextFieldName.isHidden = true
            LabelShowAge.text = String(employeeEditArrary[segueIndexForEdit!].getAge())
            BirthDaySelectAndShow.setTitle(employeeEditArrary[segueIndexForEdit!].getBirthday(), for: .normal)
            CountryShow.setTitle(employeeEditArrary[segueIndexForEdit!].getCountry(), for: .normal)


            if let willEdit = employeeEditArrary[segueIndexForEdit!] as? FullTime {
                SegmentIsFullTime()

                TextFildItem01.text = String(willEdit.getSalary())
                TextFildItem02.text = String(willEdit.getBonus())

            }else if let willEdit = employeeEditArrary[segueIndexForEdit!] as? PartTime  {
                SegmentIsPartTime()

                TextFildItem01.text = String(willEdit.getRate())
                TextFildItem02.text = String(willEdit.getHoursWorked())

            }else  if let willEdit = employeeEditArrary[segueIndexForEdit!] as? Intern {
                SegmentIsIntern()
                TextFildItem01.text = String(willEdit.getCollegeName())
            }

            if employeeEditArrary[segueIndexForEdit!].vehicle_owned?.getMake().isEmpty == false {
                SwitchVehicleShow.isOn = true
                SwitchVehicleIsOnShow()

                TextFildMake.text = employeeEditArrary[segueIndexForEdit!].vehicle_owned?.getMake()
                TextFildPlate.text = employeeEditArrary[segueIndexForEdit!].vehicle_owned?.getPlateNumber()

            }else {
                SwitchVehicleShow.isOn = false
                SwitchVehicleIsOffShow()
            }




        }else {

            LabelNameForChange.isHidden = true


        }





        //Set the default view for Add new Employee
        hidePickers()

        if TextFieldName.text?.isEmpty == true{
            LabelMake.isHidden = true
            LabelPlate.isHidden = true
            TextFildMake.isHidden = true
            TextFildPlate.isHidden = true

            LabelItem01.text = "Salary"
            LabelItem02.text = "Bonus"

            LableCountryName = ""
            LableBirthday = ""

        }else{

        }


        // For editing




    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func ButtonSaveFullTime(_ sender: UIButton) {



        var addVehicle: Vehicle? = nil
        var addEmployee:Employee? = nil


        if (!(TextFildPlate.text?.isEmpty)!) && (!(TextFildMake.text?.isEmpty)!){
            addVehicle = Vehicle(pPlate: TextFildPlate.text!, pMake: TextFildMake.text!)
        }
        else{
            addVehicle = Vehicle()
        }

        // Check Emply

        if ((TextFieldName.text?.isEmpty)!) {

            if segueIndexForEdit == nil {

                Alert.show(title: "NOTICE", message: "Please enter Name", vc: self)

            }else{ }

        }else if  (BirthDaySelectAndShow.currentTitle == "Select") {

            Alert.show(title: "NOTICE", message: "Please select Birthday", vc: self)

        }else if  Int(LabelShowAge.text!)! <= 16 {

            Alert.show(title: "Notice", message: "Only hire age great than 16 ", vc: self)


        }else if (CountryShow.currentTitle == "Select") {

            Alert.show(title: "NOTICE", message: "Please select Country", vc: self)

        }else if ((TextFildItem01.text?.isEmpty)!){

            Alert.show(title: "NOTICE", message: "Please enter \(LabelItem01.text!)", vc: self)


        }else if ((TextFildItem01.text?.isEmpty)!){

            if OutletType.selectedSegmentIndex == 2 {

            }else{

                Alert.show(title: "NOTICE", message: "Please enter \(LabelItem02.text!)", vc: self)
            }


        }else{



            //MARK: Add FullTime
            if OutletType.selectedSegmentIndex == 0 {


                addEmployee = FullTime(ppName: TextFieldName.text!, ppAge: Int(LabelShowAge.text!)!, ppBirthday: BirthDaySelectAndShow.currentTitle!, ppCountry: CountryShow.currentTitle!, salary:  Int(TextFildItem01.text!)!, bonus: Int( TextFildItem02.text!)!, pPV: addVehicle!)

                if segueIndexForEdit != nil {

                    Alert.show(title: "", message: "\(TextFieldName.text!)'s data has edited and saved ", vc: self)

                }else{

                    Alert.show(title: "Added A Full Time", message: "Name : \(TextFieldName.text!) ", vc: self)

                    navigationController!.popToRootViewController(animated: true)
                }

                //MARK: AddPart Time


            }else if  OutletType.selectedSegmentIndex == 1 {

                addEmployee = PartTime(ppName: TextFieldName.text!, ppAge: Int(LabelShowAge.text!)!, ppBirthday: BirthDaySelectAndShow.currentTitle!, ppCountry: CountryShow.currentTitle!,  hoursWorked: Int(TextFildItem01.text!)!, rate: Int( TextFildItem02.text!)!, pPV: addVehicle! )

                if segueIndexForEdit != nil {

                    Alert.show(title: "", message: "\(TextFieldName.text!)'s data has edited and saved ", vc: self)

                }else{
                    Alert.show(title: "Added A Part Time", message: "Name : \(TextFieldName.text!) ", vc: self)
                }



            }else {

                // MARK: Add Intern

                addEmployee = Intern(ppName: TextFieldName.text!, ppAge: Int(LabelShowAge.text!)!, ppBirthday: BirthDaySelectAndShow.currentTitle!, ppCountry: CountryShow.currentTitle!,  collegeName: TextFildItem01.text!, pPV: addVehicle!)

                if segueIndexForEdit != nil {

                    Alert.show(title: "", message: "\(TextFieldName.text!)'s data has edited and saved ", vc: self)

                }else{
                    Alert.show(title: "Added An Intern", message: "Name : \(TextFieldName.text!) ", vc: self)
                }



            }

        }

        if segueIndexForEdit == nil {

            if addEmployee != nil {
                arrEmployeeList.append(addEmployee!)
                currentEmployee = addEmployee

            }else {

            }
        }else {
            for i in 0..<arrEmployeeList.count {
                if arrEmployeeList[i].getName() == addEmployee?.getName() {
                    arrEmployeeList[i] = addEmployee!
                }
            }
            //            modifyDelegete?.UpdateEmployee(emp: addEmployee!)


        }





    }



    //MARK: Segmented Control Types



    @IBAction func TypeChange(_ sender: UISegmentedControl) {

        //Full Time Type
        if sender.selectedSegmentIndex == 0 {
            SegmentIsFullTime()

        }else if sender.selectedSegmentIndex == 1 {
            SegmentIsPartTime()


        }else if sender.selectedSegmentIndex == 2{
            SegmentIsIntern()
        }

    }

    func SegmentIsFullTime(){

        LabelItem02.isHidden = false
        LabelItem01.text = "Salary "
        LabelItem02.text = "Bonus "
        TextFildItem02.isHidden = false
        TextFildItem01.keyboardType = UIKeyboardType.decimalPad
        OutletType.selectedSegmentIndex = 0

    }

    func SegmentIsPartTime(){

        //             view.backgroundColor = UIColor.cyan
        LabelItem02.isHidden = false
        LabelItem01.text = "Rate    "
        LabelItem02.text = "Hours  "
        TextFildItem02.isHidden = false
        TextFildItem01.keyboardType = UIKeyboardType.decimalPad
        OutletType.selectedSegmentIndex = 1

    }

    func SegmentIsIntern(){

        LabelItem01.text = "School"
        LabelItem02.text = "Bonus:       1,000 (fixed)"
        TextFildItem02.isHidden = true
        TextFildItem01.keyboardType = UIKeyboardType.default
        OutletType.selectedSegmentIndex = 2
    }


    //MARK:  Vehicel Swith
    @IBAction func SwitchVehicle(_ sender: UISwitch) {

        if sender.isOn == true {

            SwitchVehicleIsOnShow()


        }else {
            SwitchVehicleIsOffShow()

        }


    }

    func SwitchVehicleIsOnShow() {

        LabelVehicleYesNo.isHidden = true
        LabelMake.isHidden = false
        LabelPlate.isHidden = false
        TextFildMake.isHidden = false
        TextFildPlate.isHidden = false

    }

    func SwitchVehicleIsOffShow() {
        LabelVehicleYesNo.isHidden = false
        LabelMake.isHidden = true
        LabelPlate.isHidden = true
        TextFildMake.isHidden = true
        TextFildPlate.isHidden = true
        TextFildMake.text = ""
        TextFildPlate.text = ""

    }




    @IBAction func DatePickerChanged(_ sender: Any) {

        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-dd, YYYY"


        let formatter2 = DateFormatter()
        formatter2.dateFormat = "YYYY"

        let formatter3 = DateFormatter()
        formatter3.dateFormat = "MM"

        let formatter4 = DateFormatter()
        formatter4.dateFormat = "dd"

        BirthDaySelectAndShow.setTitle((formatter.string(from:DatePickerBirthDay.date)), for: .normal)


        let currentDate = NSDate()

        LableBirthday = formatter.string(from: DatePickerBirthDay.date)

        let ThisYear = Int(formatter2.string(from: currentDate as Date))
        let ThisMonth = Int(formatter3.string(from: currentDate as Date!))
        let ThisDay = Int(formatter4.string(from: currentDate as Date!))


        print("This year:\(ThisYear!)")
        print("This Month : \(ThisMonth!)")
        print("This day : \(ThisDay!)")


        let birthYear = Int (formatter2.string(from: DatePickerBirthDay.date))
        let birthMonth = Int (formatter3.string(from: DatePickerBirthDay.date))
        let birthDay = Int (formatter4.string(from: DatePickerBirthDay.date))

        var age : Int = 0

        if  birthMonth! > ThisMonth! {

            age = ThisYear! - birthYear! - 1

        } else if birthMonth! == ThisMonth! &&  birthDay! > ThisDay!{
            age = ThisYear! - birthYear! - 1

        }else {
            age = ThisYear! - birthYear!
        }


        print("BirthYear : \(birthYear!)")
        print("BirthMonth : \(birthMonth!)")
        print("BirthDay : \(birthDay!)")
        print("Age: \(age)")

        if age <= 0 {
            LabelShowAge.text = String(age)
            Alert.show(title: "Notice", message: "The age should great than 0 ", vc: self)
        }else if age <= 16 {
            LabelShowAge.text = String(age)
            Alert.show(title: "Notice", message: "Only hire age great than 16 ", vc: self)

        }else{

            LabelShowAge.text = String(age)
        }
    }



    //MARK: Call and Out Country KeyBoard


    @IBAction func ButtonSetCountry(_ sender: Any) {
        hidePickers()
        
        ToolbarCountry.isHidden = false
        PickerCountry.isHidden = false
        
        
        
    }
    
    @IBAction func ButtonCountryDone(_ sender: UIBarButtonItem) {
        let row = PickerCountry.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        
        
        CountryShow.setTitle(selected, for: .normal)
        
        LableCountryName = selected
        
        ToolbarCountry.isHidden = true
        PickerCountry.isHidden = true
        
        
    }
    
    
    // MARK:-
    // MARK: Picker Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    
    // MARK: Picker Delegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return characterNames[row]
    }
    
    @IBAction func onTapGestureRecognized(_ sender: Any) {
        
        
        hidePickers()
    }
    
    
    
    @IBAction func ButtonSelectBirthDay(_ sender: UIButton) {
        hidePickers()
        ToolbarBirthDay.isHidden = false
        DatePickerBirthDay.isHidden = false
    }
    
    
    
    @IBAction func ButtonBirthDayDone(_ sender: UIBarButtonItem) {
        
        ToolbarBirthDay.isHidden = true
        DatePickerBirthDay.isHidden = true
        
        
    }
    
    func hidePickers(){
        ToolbarBirthDay.isHidden = true
        DatePickerBirthDay.isHidden = true
        
        ToolbarCountry.isHidden = true
        PickerCountry.isHidden = true
        
        TextFildItem02.resignFirstResponder()
        TextFildItem01.resignFirstResponder()
        TextFildPlate.resignFirstResponder()
        TextFildMake.resignFirstResponder()
        TextFieldName.resignFirstResponder()
        
        
    }
    
    
    
    
    
    
    
    
}
