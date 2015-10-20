//
//  AboutTableViewController.swift
//  eduadmin
//
//  Created by Li Jie on 10/20/15.
//  Copyright © 2015 PUPBOSS. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var versionLable: UILabel!
    
    @IBOutlet weak var rightsLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.versionLable.text = Constants.AppInfo.APP_VERSION
        
        self.rightsLable.text = "Copyright © 2014-" + String(Constants.DateInfo.YEAR) + " LNTU.ORG All Rights Reserved"
        
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (indexPath.row == 0) {
            
            self.performSegueWithIdentifier("about2web", sender: Constants.DeveloperInfo.WEB_SITE)
        }
        if (indexPath.row == 1) {
            
            self.performSegueWithIdentifier("about2web", sender: Constants.DeveloperInfo.WEIBO_URL)
        }
        if (indexPath.row == 2) {
            
            self.performSegueWithIdentifier("about2web", sender: Constants.DeveloperInfo.WEB_SITE)
        }
        if (indexPath.row == 3) {
            
            self.performSegueWithIdentifier("about2web", sender: Constants.AppInfo.FEEDBACK_URL)
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    // MARK: - Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        let con = segue.destinationViewController as! ShowWebViewController
        
        con.webUrl = sender as! String
    }

}
