//
//  PayrollViewController.swift
//  iOS_Assignment_Jenhao_HR_System
//
//  Created by HSIAO JENHAO on 2016-12-04.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit

struct Number {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
extension Integer {
    var stringWithSepator: String {
        return Number.withSeparator.string(from: NSNumber(value: hashValue)) ?? ""
    }
}

extension Double {

}



class PayrollViewController: UIViewController {


    @IBOutlet weak var LabelFullTimeNumber: UILabel!

    @IBOutlet weak var LabelFullTimeSub: UILabel!

    @IBOutlet weak var LabelPartTimeNumber: UILabel!

    @IBOutlet weak var LabelPartTimeSub: UILabel!

    @IBOutlet weak var LabelInternNumber: UILabel!

    @IBOutlet weak var LabelInternSub: UILabel!

    @IBOutlet weak var LabelMembers: UILabel!


    @IBOutlet weak var LabelTotal: UILabel!

    var fulltimeNumber :Int = 0

    var fulltimeSub:Int = 0
    var parttimeNumber:Int = 0
    var parttimeSub:Int = 0
    var internNumber:Int = 0
    var internSub:Int = 0
    var sumNumber:Int = 0
    var payrollTotoal:Int = 0







    override func viewDidLoad() {
        super.viewDidLoad()

        let fulltimeSub2 = fulltimeSub.stringWithSepator
        let parttimeSub2 = parttimeSub.stringWithSepator
        let internSub2 = internSub.stringWithSepator
        let payrollTotoal2 = payrollTotoal.stringWithSepator



        LabelFullTimeNumber.text = String(fulltimeNumber)
        LabelFullTimeSub.text = String(fulltimeSub2)
        LabelPartTimeNumber.text = String(parttimeNumber)
        LabelPartTimeSub.text = String(parttimeSub2)
        LabelInternNumber.text = String(internNumber)
        LabelInternSub.text = String(internSub2)
        LabelMembers.text = String(sumNumber)
        LabelTotal.text = String(payrollTotoal2)





    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
