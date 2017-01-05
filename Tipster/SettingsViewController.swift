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
    @IBOutlet weak var defaultTipLable: UILabel!
    @IBOutlet weak var ResetLable: UIButton!
    @IBOutlet var BaseView: UIView!
    @IBOutlet weak var BlurView: UIVisualEffectView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "defaultSegmentIndex")
        defaultTipSegement.selectedSegmentIndex = index
        brightenViews()
        setActivePosition()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
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
    
    func brightenViews(){
        BlurView.alpha = 1
        UIView.animate(withDuration: 0.7) {
            self.BlurView.alpha = 0
        }
    }
    
    func darkenViews() {
        BlurView.alpha = 0
        UIView.animate(withDuration: 0.7) {
            self.BlurView.alpha = 1
        }
    }
    
    func setRestPosition() {
        defaultTipLable.transform = CGAffineTransform(translationX: 0, y: 0)
        defaultTipSegement.transform = CGAffineTransform(translationX: 0, y: 0)
        ResetLable.transform = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.5) {
            self.defaultTipSegement.transform = CGAffineTransform(translationX: 0, y: -200)
            self.defaultTipLable.transform = CGAffineTransform(translationX: 0, y: -200)
            self.ResetLable.transform = CGAffineTransform(translationX: 200, y: 0)
        }
    }
    
    func setActivePosition(){
        defaultTipLable.transform = CGAffineTransform(translationX: 0, y: -200)
        defaultTipSegement.transform = CGAffineTransform(translationX: 0, y: -200)
        ResetLable.transform = CGAffineTransform(translationX: 200, y: 0)
            UIView.animate(withDuration: 0.5){
                self.defaultTipSegement.transform = CGAffineTransform(translationX: 0, y: 0)
                self.defaultTipLable.transform = CGAffineTransform(translationX: 0, y: 0)
                self.ResetLable.transform = CGAffineTransform(translationX: 0, y: 0)
        }
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
