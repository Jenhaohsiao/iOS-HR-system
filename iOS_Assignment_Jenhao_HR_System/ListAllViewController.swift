//
//  ListAllViewController.swift
//  iOS_Assignment_Jenhao_HR_System
//
//  Created by HSIAO JENHAO on 2016-11-27.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit



var arrEmployeeList : [Employee] = []

class ListAllViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating{

    @IBOutlet var tableViewList: UITableView!

    var filterArrEmployeeList : [Employee] = []

    var EmpRearchController: UISearchController!
    var EmpResultsController = UITableViewController()


    override func viewDidLoad() {
        super.viewDidLoad()





        var ft1 : FullTime
        var ft2 : FullTime

        var pt1 : PartTime
        var pt2 : PartTime
        var in1 : Intern
        let v1 = Vehicle(pPlate: "VCK 502", pMake: "HONDA")

        ft1 = FullTime(ppName: "John", ppAge: 31, ppBirthday: "May-20,1985", ppCountry: "New Zealand", salary: 250000, bonus: 3500, pPV: v1)


        ft2 = FullTime(ppName: "Mark", ppAge: 17, ppBirthday: "Jan-09,1999", ppCountry: "Japan", salary: 609365, bonus: 3655,  pPPlate: "K78 990", pPMake: "Toyota")


        pt1 = PartTime(ppName: "Rocky", ppAge: 20, ppBirthday: "Feb-01,1996", ppCountry: "Taiwan", rate: 20, hoursWorked: 120, pPPlate: "MKM266", pPMake: "Toyota")

        pt2 = PartTime(ppName: "Lucy", ppAge: 46, ppBirthday: "March-16, 1970", ppCountry: "Brazil", rate: 90, hoursWorked: 150, pPPlate: "", pPMake: "")



        in1 = Intern(ppName: "Nike", ppAge: 30, ppBirthday:  "Feb-01,1986", ppCountry: "Canada", collegeName: "UofT", pPPlate: "", pPMake: "")



        arrEmployeeList.append(ft1)
        arrEmployeeList.append(ft2)

        arrEmployeeList.append(pt1)
        arrEmployeeList.append(pt2)
        arrEmployeeList.append(in1)



        self.EmpResultsController.tableView.dataSource = self
        self.EmpResultsController.tableView.delegate = self


        self.EmpRearchController = UISearchController(searchResultsController: self.EmpResultsController)
        self.tableViewList.tableHeaderView = self.EmpRearchController.searchBar
        self.EmpRearchController.searchResultsUpdater = self
        self.EmpRearchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        EmpRearchController.searchBar.barTintColor = UIColor.white

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if tableView == self.tableViewList{
            return 70

        } else {

            return 70
        }
    }


    func updateSearchResults(for searchController: UISearchController) {

        //Filter through the employee

        self.filterArrEmployeeList = arrEmployeeList.filter { (EnterWord) -> Bool in
            if EnterWord.getName().localizedLowercase.contains(self.EmpRearchController.searchBar.text!.localizedLowercase){
                return true

            }else {

                return false
            }
        }

        //Update the results TableView

        EmpResultsController.tableView.reloadData()

    }

    override func viewDidAppear(_ animated: Bool) {

        self.tableViewList.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if tableView == self.tableViewList{
            return arrEmployeeList.count
        }else{

            return self.filterArrEmployeeList.count
        }


    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellIdentifier = "ListCell"
        let cell = self.tableViewList.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListTableViewCell

        let empolyeeInfo = arrEmployeeList[indexPath.row]

        if tableView == self.tableViewList{

            cell.CellLabelName?.text = empolyeeInfo.getName()
            cell.CellLabelAge?.text = String(empolyeeInfo.getAge())

            if empolyeeInfo is FullTime {
                cell.CellLabelType?.text = "Full Time"
            }else if empolyeeInfo is PartTime{
                cell.CellLabelType?.text = "Part Time"
            }else {
                cell.CellLabelType?.text = "Intern"
            }

            cell.CellLabelCountryName?.text = String(empolyeeInfo.getCountry())
            let empEarn = empolyeeInfo.calcEarnings().stringWithSepator
            cell.CellLabelEarn?.text = String(empEarn)
            if empolyeeInfo.vehicle_owned?.getMake() != "" {
                cell.CellLabelCarYesOrNo?.text = "🚗✔️"
            }else{
                cell.CellLabelCarYesOrNo?.text = "🚗❌"
            }

        }else{


            cell.CellLabelName?.text = self.filterArrEmployeeList[indexPath.row].getName()
            cell.CellLabelAge?.text = String(self.filterArrEmployeeList[indexPath.row].getAge())

            if self.filterArrEmployeeList[indexPath.row] is FullTime {
                cell.CellLabelType?.text = "Full Time"
            }else if self.filterArrEmployeeList[indexPath.row] is PartTime{
                cell.CellLabelType?.text = "Part Time"
            }else {
                cell.CellLabelType?.text = "Intern"
            }

            cell.CellLabelCountryName?.text = String(self.filterArrEmployeeList[indexPath.row].getCountry())
            let empEarn = self.filterArrEmployeeList[indexPath.row].calcEarnings().stringWithSepator
            cell.CellLabelEarn?.text = String(empEarn)
            if self.filterArrEmployeeList[indexPath.row].vehicle_owned?.getMake() != "" {
                cell.CellLabelCarYesOrNo?.text = "🚗✔️"
            }else{
                cell.CellLabelCarYesOrNo?.text = "🚗❌"
            }


        }


        return cell
    }


    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            // Delete the row from the data source
            arrEmployeeList.remove(at: indexPath.row)
            //            saveMeals()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {



        //        performSegue(withIdentifier: "editEmployee", sender: arrEmployeeList[indexPath.row])


    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "editEmployee" {
            let detail = segue.destination as! AddEmployeeViewController

            if let selectedCell = sender as? ListTableViewCell{


                var indexPath = tableViewList.indexPath(for: selectedCell)
                if indexPath != nil {
                    let selectedEmployee = arrEmployeeList[(indexPath?.row)!]
                    detail.employeeEditArrary = [selectedEmployee]
                    detail.segueIndexForEdit = indexPath?.row

                }else {
                    indexPath = EmpResultsController.tableView.indexPath(for: selectedCell)!

                    for i in 0..<arrEmployeeList.count {
                        if arrEmployeeList[i].getName()  ==  filterArrEmployeeList[(indexPath?.row)!].getName() && arrEmployeeList[i].getBirthday()  ==  filterArrEmployeeList[(indexPath?.row)!].getBirthday(){

                            detail.segueIndexForEdit = i
                        }
                    }

                }
            }
        }else if segue.identifier == "AddNew" {
            print("Adding new Employee.")


        }else if segue.identifier == "showPayroll" {


            let detail = segue.destination as! PayrollViewController

            detail.fulltimeNumber = calculateFulltimenumber ()
            detail.parttimeNumber = calculateParttimenumber()
            detail.internNumber = calculateInternumber()
            detail.fulltimeSub = calculateFulltimesub()
            detail.parttimeSub = calculatePartimesub()
            detail.internSub = calculateInternsub()
            detail.sumNumber = calculateFulltimenumber () + calculateParttimenumber() + calculateInternumber() 
            detail.payrollTotoal = calculateFulltimesub() + calculatePartimesub() + calculateInternsub()


        }


    }


    func calculateFulltimenumber () -> Int{
        var FT = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is FullTime {
                FT = FT + 1
            }else{}

        }
        return FT
    }


    func calculateParttimenumber () -> Int{
        var PT = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is PartTime {
                PT = PT + 1
            }else{}

        }
        return PT
    }

    func calculateInternumber () -> Int{
        var Intern = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is Intern {
                Intern = Intern + 1
            }else{}

        }
        return Intern
    }

    func calculateFulltimesub () -> Int{
        var FTsub = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is FullTime {
                FTsub = FTsub + arrEmployeeList[i].calcEarnings()
            }else{}
            
        }
        return FTsub
    }
    
    func calculatePartimesub () -> Int{
        var PTsub = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is PartTime {
                PTsub = PTsub + arrEmployeeList[i].calcEarnings()
            }else{}
            
        }
        return PTsub
    }
    
    func calculateInternsub () -> Int{
        var InternSub = 0
        for i in 0..<arrEmployeeList.count {
            if arrEmployeeList[i] is Intern {
                InternSub = InternSub + arrEmployeeList[i].calcEarnings()
            }else{}
            
        }
        return InternSub
    }
    
    
    
    
    
    
    func ifNoTask(){
        
        if arrEmployeeList.count == 0 {
            
            Alert.show(title: "", message: "No Data Now", vc: self)
            
        }}
}
