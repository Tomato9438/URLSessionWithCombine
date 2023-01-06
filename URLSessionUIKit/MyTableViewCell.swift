//
//  MyTableViewCell.swift
//  URLSessionUIKit
//
//  Created by Tomato on 2021/09/16.
//

import UIKit

class MyTableViewCell: UITableViewCell {
	// MARK: - IBOutlet
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var thumbLabel: UILabel!
	@IBOutlet weak var descLabel: UILabel!
	@IBOutlet weak var linkLabel: UILabel!
	
	
	// MARK: - Awake
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
