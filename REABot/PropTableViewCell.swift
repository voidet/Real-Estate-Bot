//
//  PropTableViewCell.swift
//  REABot
//
//  Created by Richard S on 14/11/2014.
//  Copyright (c) 2014 Wotif. All rights reserved.
//

import UIKit
import SwiftyJSON

class PropTableViewCell: UITableViewCell {

	@IBOutlet var regionName:UILabel!
	var searchURL:NSURL?
	
	var property:JSON? {
		didSet {
			self.handleProperty()
		}
	}
	
	func handleProperty() {
		self.regionName.text = self.property?["name"].string
		self.searchURL = NSURL(string: self.property!["url"].stringValue)
	}
	
}
