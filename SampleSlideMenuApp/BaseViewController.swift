//
//  BaseViewController.swift
//  SampleSlideMenuApp
//
//  Created by Softtrends on 09/08/16.
//  Copyright © 2016 Softtrends. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(BaseViewController.onLeftBarItemSelected(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onLeftBarItemSelected(_ sender: UIBarButtonItem) {
        let center = NotificationCenter.default
        center.post(Notification(name: Notification.Name(rawValue: ContainerViewController.menuShowObsever), object: self))
    }
    
    @IBAction func onTabView(_ sender:UITapGestureRecognizer) {
        let center = NotificationCenter.default
        center.post(Notification(name: Notification.Name(rawValue: ContainerViewController.menuHideObsever), object: self))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
