//
//  ViewController.swift
//  Tipsy
//
//  Created by Joanna Lund on 2/9/17.
//  Copyright © 2017 Joanna Lund. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControlEighteen: UIButton!
    @IBOutlet weak var tipControltwenty: UIButton!
    @IBOutlet weak var tipControltwentyfive: UIButton!
    @IBOutlet weak var tipControlPercent: UIButton!
    
  
    
    var eighteenButtonCenter: CGPoint!
    var twentyButtonCenter: CGPoint!
    var twentyFiveButtonCenter: CGPoint!
    
    
    
   
    @IBAction func percentToggle(_ sender: UIButton) {
        if tipControlPercent.currentImage == #imageLiteral(resourceName: "percent_off") {
            UIView.animate(withDuration: 0.2 , animations: {
                //animations here!
                self.tipControlEighteen.center = self.eighteenButtonCenter
                self.tipControltwenty.center = self.twentyButtonCenter
                self.tipControltwentyfive.center = self.twentyFiveButtonCenter
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.tipControlEighteen.center = self.tipControlPercent.center
                self.tipControltwenty.center = self.tipControlPercent.center
                self.tipControltwentyfive.center = self.tipControlPercent.center
            })
            //collapse buttons
        }
        
        if sender.currentImage == #imageLiteral(resourceName: "percent_off") {
            sender.setImage(#imageLiteral(resourceName: "percent_on"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "percent_off"), for: .normal)
        }
    }
    
    @IBAction func eighteenToggle(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "eighteen_off") {
            sender.setImage(#imageLiteral(resourceName: "eighteen_on"), for: .normal)
            tipControltwenty.setImage(#imageLiteral(resourceName: "twenty_off"), for: .normal)
             tipControltwentyfive.setImage(#imageLiteral(resourceName: "twentyfive_off"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "eighteen_off"), for: .normal)
        }
    }
    
    @IBAction func twentyToggle(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "twenty_off") {
            sender.setImage(#imageLiteral(resourceName: "twenty_on"), for: .normal)
             tipControlEighteen.setImage(#imageLiteral(resourceName: "eighteen_off"), for: .normal)
            tipControltwentyfive.setImage(#imageLiteral(resourceName: "twentyfive_off"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "twenty_off"), for: .normal)
        }
    }
    
    @IBAction func twentyfiveToggle(_ sender: UIButton) {
        if sender.currentImage == #imageLiteral(resourceName: "twentyfive_off") {
            sender.setImage(#imageLiteral(resourceName: "twentyfive_on"), for: .normal)
            tipControlEighteen.setImage(#imageLiteral(resourceName: "eighteen_off"), for: .normal)
            tipControltwenty.setImage(#imageLiteral(resourceName: "twenty_off"), for: .normal)
        } else {
            sender.setImage(#imageLiteral(resourceName: "twentyfive_off"), for: .normal)
        }
    }
    
    

    
    var percentage = 0.2
    
  

    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        // Remember the center of the buttons
        self.eighteenButtonCenter = self.tipControlEighteen.center
        self.twentyButtonCenter = self.tipControltwenty.center
        self.twentyFiveButtonCenter = self.tipControltwentyfive.center
        // Move the buttons under the big percentage button
        self.tipControlEighteen.center = self.tipControlPercent.center
        self.tipControltwenty.center = self.tipControlPercent.center
        self.tipControltwentyfive.center = self.tipControlPercent.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func eighteenClicked(_ sender: Any) {
            percentage = 0.18
         calculateTip(1)
    }
    @IBAction func twentyClicked(_ sender: Any) {
        percentage = 0.2
         calculateTip(1)
    }
    @IBAction func twentyFiveClicked(_ sender: Any) {
        percentage = 0.25
        
        calculateTip(1)
    }
    @IBAction func calculateTip(_ sender: Any) {
      

        
      
        let bill = Double(billField.text!) ?? 0
        let tip = bill * percentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    
    
    
}

 
