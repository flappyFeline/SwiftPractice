//
//  ViewController.swift
//  Project 14 - EmojiSlotMachine
//
//  Created by Durand on 2017/6/15.
//  Copyright © 2017年 Durand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiPickerView: UIPickerView! {
        didSet {
            emojiPickerView.delegate = self;
            emojiPickerView.dataSource = self;
        }
    }
    @IBOutlet weak var goButton: UIButton! {
        didSet {
            goButton.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var resultLabel: UILabel! {
        didSet {
            resultLabel.text = "";
        }
    }
    
    var  imageArray = [String]();
    var dataArray1 = [Int]();
    var dataArray2 = [Int]();
    var dataArray3 = [Int]();
    var bounds: CGRect = .zero;
    

    @IBAction func didClickGoBtn(_ sender: Any) {
        
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        if(dataArray1[emojiPickerView.selectedRow(inComponent: 0)] == dataArray2[emojiPickerView.selectedRow(inComponent: 1)] && dataArray2[emojiPickerView.selectedRow(inComponent: 1)] == dataArray3[emojiPickerView.selectedRow(inComponent: 2)]) {
            resultLabel.text = "Bingo!"
        } else {
            resultLabel.text = "💔"
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: { 
            
            var baseRect = self.bounds;
            baseRect.size.width += 20;
            self.goButton.bounds = baseRect;
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.goButton.bounds = self.bounds;
            }, completion: nil);
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bounds = goButton.bounds;
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"];

        let count = imageArray.count;
        
        for _ in 0..<100 {
            dataArray1.append((Int(arc4random()) % count));
            dataArray2.append((Int(arc4random()) % count));
            dataArray3.append((Int(arc4random()) % count));
        }
        
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        goButton.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            
            self.goButton.alpha = 1
            
        }, completion: nil)
        
    }




}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        
        switch component {
        case 0:
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        case 1:
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        default:
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        return pickerLabel
        
    }

}

