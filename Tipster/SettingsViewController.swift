//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Naveen Kashyap on 1/3/17.
//  Copyright © 2017 Naveen Kashyap. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipSegement: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultSegmentIndex")
        defaultTipSegement.selectedSegmentIndex = index
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultSelected(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let index = defaultTipSegement.selectedSegmentIndex
        defaults.set(index, forKey: "defaultSegmentIndex")
        defaults.synchronize()
    }
    
    @IBAction func onReset(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(1, forKey: "defaultSegmentIndex")
        defaultTipSegement.selectedSegmentIndex = 1
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
