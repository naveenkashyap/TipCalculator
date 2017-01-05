//
//  ViewController.swift
//  Tipster
//
//  Created by Naveen Kashyap on 1/3/17.
//  Copyright © 2017 Naveen Kashyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var BaseView: UIView!
    @IBOutlet weak var LabelView: UIView!
    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!
    @IBOutlet weak var BlurView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tipster"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultSegmentIndex")
        TipControl.selectedSegmentIndex = index
        let billAmount = defaults.string(forKey: "previousBillAmount") ?? ""
        BillField.text = billAmount
        BillField.placeholder = Locale.current.currencySymbol
        calculateTip(TipControl)
        brightenViews()
        setActivePosition()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let previousBillAmount = BillField.text
        defaults.set(previousBillAmount, forKey: "previousBillAmount")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func brightenViews(){
        BaseView.alpha = 0
        BlurView.alpha = 1
        UIView.animate(withDuration: 0.7) {
            self.BaseView.alpha = 1
            self.BlurView.alpha = 0
        }
    }
    
    func darkenViews() {
        BaseView.alpha = 1
        BlurView.alpha = 0
        UIView.animate(withDuration: 0.7) {
            self.BaseView.alpha = 0
            self.BlurView.alpha = 1
        }
    }
    
    func setRestPosition() {
        BillField.transform = CGAffineTransform(translationX: 0, y: 0)
        LabelView.transform = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.9) {
            self.BillField.transform = CGAffineTransform(translationX: 0, y: 100)
            self.LabelView.transform = CGAffineTransform(translationX: 0, y: 200)
        }
    }
    
    func setActivePosition(){
        BillField.transform = CGAffineTransform(translationX: 0, y: 100)
        LabelView.transform = CGAffineTransform(translationX: 0, y: 200)
        UIView.animate(withDuration: 0.9, animations: {
            self.BillField.transform = CGAffineTransform(translationX: 0, y: 0)
            self.LabelView.transform = CGAffineTransform(translationX: 0, y: 0)
        }) {(Bool) in
            self.BillField.becomeFirstResponder()
        }
    }
    
    @IBAction func onTapField(_ sender: AnyObject) {
        setActivePosition()
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
        setRestPosition()

    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentagess = [0.1,0.15,0.2]
        
        let bill = Double(BillField.text!) ?? 0
        let tip = bill * tipPercentagess[TipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale.current
        
        TipLabel.text = formatter.string(from: tip as NSNumber)
        TotalLabel.text = formatter.string(from: total as NSNumber)
    }
}

