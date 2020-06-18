//
//  TableViewCell.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 07/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(description: String, customerName: String, price: Int) {
        self.descriptionLabel.text = description
        self.customerLabel.text = customerName
        self.priceLabel.text = String(price)
    }

}
