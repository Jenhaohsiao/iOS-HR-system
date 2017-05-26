//
//  PickerViewController.swift
//  iOS_Assignment_Jenhao_HR_System
//
//  Created by HSIAO JENHAO on 2016-11-28.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource  {


    @IBOutlet weak var singlePicker: UIPickerView!

    private let characterNames = [
        "Luke", "Leia", "Han", "Chewbacca", "Artoo",
        "Threepio", "Lando"]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "You selected \(selected)!"

        let alert = UIAlertController(
            title: title,
            message: "Thank you for choosing",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "You're welcome",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

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
    



}
