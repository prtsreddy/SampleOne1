//
//  MainNavigationController.swift
//  SampleSlideMenuApp
//
//  Created by Softtrends on 09/08/16.
//  Copyright © 2016 Softtrends. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    static var menuSelectedObserver:String = "menuSelectedObserver"
    fileprivate var menuSelectedObserver:NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObserver()
    }
    
    @IBAction func onTabView(_ sender:UITapGestureRecognizer) {
        print("Tapped")
    }
    
    func addObserver() {
        let center = NotificationCenter.default
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        menuSelectedObserver = center.addObserver(forName: NSNotification.Name(rawValue: MainNavigationController.menuSelectedObserver), object: nil, queue: nil) { (notification: Notification) in
            var userinfo = (notification as NSNotification).userInfo as? [String:AnyObject]
            if userinfo != nil {
                let mvc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                let indexPath = userinfo!["indexPath"] as! IndexPath
                mvc.title = "Menu \((indexPath as NSIndexPath).row+1)"
                self.setViewControllers([mvc], animated: false)
            }
        }
    }
    
    func removeObserver() {
        let center = NotificationCenter.default
        if menuSelectedObserver !=  nil {
            center.removeObserver(menuSelectedObserver!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
