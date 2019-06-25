//
//  TableViewCell.swift
//  Countries_alamo
//
//  Created by sics on 25/06/19.
//  Copyright © 2019 sics. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var two_outlet: UILabel!
    @IBOutlet weak var threecodeoutlet: UILabel!
    @IBOutlet weak var twocodeoutlet: UILabel!
    @IBOutlet weak var nameoutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
