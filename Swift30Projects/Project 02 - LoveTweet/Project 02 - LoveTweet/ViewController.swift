//
//  ViewController.swift
//  Project 02 - LoveTweet
//
//  Created by Durand on 7/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit
import Social

var tweet:String = ""

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSeg: UISegmentedControl!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var straightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func salaryHandler(_ sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        salaryLabel.text = "$\(i)k"
    }
    @IBAction func tweetTapped(_ sender: AnyObject) {
        if (nameTextField.text == "" || workTextField.text == "" || salaryLabel.text == "") {
            showAlert(title:"Info Miss", message: "Please fill out the form", buttonTitle: "Ok");
            return;
        }
        
        let name: String! = nameTextField.text;
        let work: String! = workTextField.text;
        let salary: String! = salaryLabel.text;
        
        let gregorian = Calendar(identifier: .gregorian);
        let now = Date();
        let components = (gregorian as NSCalendar?)?.components(.year, from: birthdayPicker.date, to: now, options: []);
        let age: Int! = components?.year;
        
        var interestedIn: String! = "Women";
        if genderSeg.selectedSegmentIndex == 0 && !straightSwitch.isOn {
            interestedIn = "Men";
        } else if genderSeg.selectedSegmentIndex == 1 && straightSwitch.isOn {
            interestedIn = "Women"
        }
        
        let tweet = "Hi, I am \(name!). As a \(age!)-year-old \(work!) earning \(salary!)/year, I am interested in \(interestedIn!). Feel free to contact me!"
        
        tweetSLCVC(tweet)
        
    }
    
    fileprivate func tweetSLCVC(_ tweet: String) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitterController:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterController.setInitialText(tweet)
            self.present(twitterController, animated: true, completion: nil)
        } else {
            showAlert(title:"Twitter Unavailable", message: "Please configure your twitter account on device", buttonTitle: "Ok")
        }
    }
    
    fileprivate func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil));
        self.present(alert, animated: true, completion: nil);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // dismiss keyboard
        view.endEditing(true)
    }
}

