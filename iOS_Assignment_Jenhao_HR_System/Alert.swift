//
//  Alert.swift
//  HRAppiOS_Jenhao
//
//  Created by HSIAO JENHAO on 2016-11-23.
//  Copyright © 2016 Jenhao.ca. All rights reserved.
//

import Foundation
import UIKit


class Alert: NSObject{

    static func show(title:String, message:String, vc:UIViewController){

        //create the controller
        let alertCT = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //create Alert Action

        let okAc = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            (alert:UIAlertAction) -> Void in alertCT.dismiss(animated: true,completion:nil)
        }

        //Add Alert Actions to Alert Controller
        alertCT.addAction(okAc)

        //Display Alert Controller
        vc.present(alertCT, animated: true, completion:nil)


}

}
