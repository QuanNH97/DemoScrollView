//
//  NamesTableViewCell.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class NamesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(name: String) {
        if name == "" {
            nameLabel.isHidden = true
        }
//        else {
//            nameLabel.isHidden = false
//        }
        nameLabel.text = name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.isHidden = false
    }
    
    func update(with newName: String) {
        if let nameLabel = nameLabel {
            nameLabel.text = newName
        }
    }

}
