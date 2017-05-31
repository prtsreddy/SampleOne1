//
//  DetailViewController.swift
//  SampleSlideMenuApp
//
//  Created by Softtrends on 09/08/16.
//  Copyright © 2016 Softtrends. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    @IBOutlet var TextLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: self.title))")
        self.TextLabel?.text = self.title
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func onButtonPressed(_ sender:UIButton) {
        print("Button Pressed")
        
        let AlertController:UIAlertController! = UIAlertController(title: "Menu", message: self.title! + " Selected", preferredStyle: .alert)
        
        let OK:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: {alertView in
        })
        
        AlertController.addAction(OK)
        self.present(AlertController, animated: true, completion: {})
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
