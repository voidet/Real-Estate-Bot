//
//  ViewController.swift
//  REABot
//
//  Created by Richard S on 13/11/2014.
//  Copyright (c) 2014 Wotif. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	var results:[JSON]?
	@IBOutlet var tableView:UITableView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.loadRegions()
	}
	
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "goToPage" {
			var destVC = segue.destinationViewController as WebViewController
			var row = self.tableView.indexPathForSelectedRow()?.row
			var json = self.results?[row!] as JSON!
			destVC.url = NSURL(string: json["url"].stringValue)
			self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow()!, animated: true)
		}
	}

	func loadRegions() {
		let url = "http://static.paws2path.com/rea.json"
		Alamofire.request(.GET, url).responseSwiftyJSON { (request, response, json, error) in
			if (json != nil) {
				self.results = json.arrayValue as [JSON]?
				self.tableView.reloadData();
			}
		}
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.results?.count ?? 0
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCellWithIdentifier("propCell") as PropTableViewCell
		cell.property = self.results?[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.performSegueWithIdentifier("goToPage", sender: self)
		
	}
	
}

