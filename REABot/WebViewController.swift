//
//  WebViewController.swift
//  REABot
//
//  Created by Richard S on 14/11/2014.
//  Copyright (c) 2014 Wotif. All rights reserved.
//

import UIKit
import WebKit
import Snappy

class WebViewController: UIViewController, WKNavigationDelegate {

	var url:NSURL?
	var webView:WKWebView? = WKWebView()
	@IBOutlet var activityIndicator:UIActivityIndicatorView!
	
	override func viewDidLoad() {
		self.activityIndicator.color = UIColor.blackColor()
		self.activityIndicator.startAnimating()
		self.webView?.navigationDelegate = self
		
		if (url != nil) {
			self.loadWebPage(url)
			self.view.insertSubview(self.webView!, belowSubview: self.activityIndicator)
			
			self.webView?.snp_makeConstraints { make in
				make.edges.equalTo(self.view)
				return
			}
		}
	}
	
	func loadWebPage(url:NSURL?) {
		var request = NSURLRequest(URL: self.url!)
		self.webView?.loadRequest(request)
	}
	
	func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
		self.activityIndicator.removeFromSuperview()
	}
	
}
