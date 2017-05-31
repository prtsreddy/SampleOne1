//
//  ViewController.swift
//  SampleSlideMenuApp
//
//  Created by Softtrends on 09/08/16.
//  Copyright © 2016 Softtrends. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var leftViewController:UIViewController? {
        willSet {
            if self.leftViewController != nil {
                if self.leftViewController?.view != nil {
                    self.leftViewController?.view.removeFromSuperview()
                }
                self.leftViewController?.removeFromParentViewController()
            }
        }
        didSet {
            self.view.addSubview((self.leftViewController?.view)!)
            self.addChildViewController(self.leftViewController!)
        }
    }
    
    var rightViewController:UIViewController? {
        willSet {
            if self.rightViewController != nil {
                if self.rightViewController?.view != nil {
                    self.rightViewController?.view.removeFromSuperview()
                }
                self.rightViewController?.removeFromParentViewController()
            }
        }
        didSet {
            self.view.addSubview((self.rightViewController?.view)!)
            self.addChildViewController(self.rightViewController!)
        }
    }
    
    var menuShow:Bool = false
    
    @IBAction func leftSwipe(_ sender : UISwipeGestureRecognizer) {
        hideMenu()
    }
    
    @IBAction func rightSwipe(_ sender : UISwipeGestureRecognizer) {
        showMenu()
    }
    fileprivate var menuHideObserver:NSObjectProtocol?
    fileprivate var menuShowObserver:NSObjectProtocol?
    static var menuShowObsever:String = "menuShowObsever"
    static var menuHideObsever:String = "menuHideObsever"
    func showMenu() {
        if self.menuShow == false {
        UIView.animate(withDuration: 0.3, animations: {
            self.rightViewController!.view.frame = CGRect(x: self.view.frame.origin.x + 235, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShow = true
        })
        }
    }
    
    func hideMenu() {
        if menuShow == true {
        UIView.animate(withDuration: 0.3, animations: {
            self.rightViewController!.view.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShow = false
        })
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainNavigationController: UINavigationController = storyboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        
        let menuViewController: MenuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController")as! MenuViewController
        
        self.leftViewController = menuViewController
        self.rightViewController = mainNavigationController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObserver()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addObserver() {
        let center = NotificationCenter.default
        
        menuHideObserver = center.addObserver(forName: NSNotification.Name(rawValue: ContainerViewController.menuHideObsever), object: nil, queue: nil) { (notification: Notification) in
            self.hideMenu()
        }
        menuShowObserver = center.addObserver(forName: NSNotification.Name(rawValue: ContainerViewController.menuShowObsever), object: nil, queue: nil) { (notification: Notification) in
            
            if self.menuShow == true {
                self.hideMenu()
            } else {
                self.showMenu()
            }
        }
    }
    
    func removeObserver() {
        let center = NotificationCenter.default
        if menuHideObserver !=  nil {
            center.removeObserver(menuHideObserver!)
        }
        if menuShowObserver !=  nil {
            center.removeObserver(menuShowObserver!)
        }
    }
}

