//
//  ViewController.swift
//  Tipster
//
//  Created by Naveen Kashyap on 1/3/17.
//  Copyright © 2017 Naveen Kashyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    @IBOutlet weak var BlurView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tipster"
        BillField.placeholder = "$"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BlurView.alpha = 1
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultSegmentIndex")
        TipControl.selectedSegmentIndex = index
        calculateTip(TipControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIViewPropertyAnimator(duration: 1, curve: .easeInOut){
            self.BlurView.alpha = 0
        }.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTapField(_ sender: AnyObject) {
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentagess = [0.1,0.15,0.2]
        
        let bill = Double(BillField.text!) ?? 0
        let tip = bill * tipPercentagess[TipControl.selectedSegmentIndex]
        let total = bill + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
}

