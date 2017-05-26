//
//  ListTableViewCell.swift
//  iOS_Assignment_Jenhao_HR_System
//
//  Created by HSIAO JENHAO on 2016-11-27.
//  Copyright © 2016 HSIAO JENHAO. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var CellLabelName: UILabel!
    @IBOutlet weak var CellLabelAge: UILabel!
    @IBOutlet weak var CellLabelType: UILabel!
    @IBOutlet weak var CellLabelEarn: UILabel!
    @IBOutlet weak var CellLabelCarYesOrNo: UILabel!
    @IBOutlet weak var CellLabelCountryName: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
