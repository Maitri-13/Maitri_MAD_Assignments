//
//  DetailViewController.swift
//  Lab3_extracredit
//
//  Created by Maitri Chattopadhyay on 3/7/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit
import WebKit
class DetailViewController: UIViewController,  WKNavigationDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var webSpinner: UIActivityIndicatorView!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    //WKNavigationDelegate method that is called when a web page begins to load
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webSpinner.startAnimating()
    }
    
    //WKNavigationDelegate method that is called when a web page loads successfully
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webSpinner.stopAnimating()
    }
    
    func loadWebPage(_ urlString: String)
    {
        let myurl = URL(string: urlString)
        let request = URLRequest(url: myurl!)
        webView.load(request)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                loadWebPage(detail.description)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.navigationDelegate = self
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

}

