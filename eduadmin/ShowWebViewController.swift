//
//  ShowWebViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/20/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class ShowWebViewController: UIViewController, UIWebViewDelegate {

    var webUrl = ""
    
    // MARK: - Outlets
    
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    
    @IBOutlet weak var goNextButton: UIBarButtonItem!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var actionButton: UIBarButtonItem!
    
    
    // MARK: - Actions
    
    @IBAction func goBack(sender: UIBarButtonItem) {
        
        self.webView.goBack()
    }
    
    @IBAction func goNext(sender: UIBarButtonItem) {
        
        self.webView.goForward()
    }
    
    @IBAction func goToSafari(sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.loadRequest(NSURLRequest.init(URL: NSURL.init(string: self.webUrl)!))
        
        if self.webUrl == Constants.NOTICE_URL {
            
            self.actionButton.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        print(error)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        if self.webUrl == Constants.NOTICE_URL {
            
            MBProgressHUD.showMessage("点击右上角用 Safari 访问")
        } else {
            
            if self.webView.canGoBack {
                
                self.goBackButton.enabled = true
            } else {
                
                self.goBackButton.enabled = false
            }
            
            if self.webView.canGoForward {
                
                self.goNextButton.enabled = true
            } else {
                
                self.goNextButton.enabled = false
            }
            
            MBProgressHUD.showMessage(Constants.Notification.LOADING)
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(3 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
                
                MBProgressHUD.hideHUD()
            }
        }
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        
        MBProgressHUD.hideHUD()
    }

}
