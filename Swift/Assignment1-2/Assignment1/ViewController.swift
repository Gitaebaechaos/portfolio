//
//  ViewController.swift
//  Assignment1
//
//  Created by 배기태 on 2021/09/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var enterNumber: UITextField!
    
    @IBOutlet weak var mechanicalResult: UILabel!
    
    @IBOutlet weak var electricalResult: UILabel!
    
    @IBOutlet weak var metricResult: UILabel!
    
    private var isNew = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        enterNumber.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if(textField === enterNumber) {
            textField.resignFirstResponder()
        }
            
        else { textField.resignFirstResponder() }
        return true
    }

    @IBAction func numberConvert(_ sender: UIButton) {
            
        if enterNumber.text != nil, let newValue = Double(enterNumber.text!) {
            self.view.endEditing(true)
            
            
            let RIM: Double = 1 * (newValue * 0.745699872)
                
                mechanicalResult.text = String(RIM)

                let RIMText: String = String(format: "%.8f", RIM)
                
                mechanicalResult.text = String(RIMText)
                
            let RIE: Double = 1 * (newValue * 0.746)
            electricalResult.text = String(RIE)
            
            let RIEText: String = String(format: "%.4f", RIE)
            
            electricalResult.text = String(RIEText)
            
                let RIC: Double = 1 * (newValue * 0.73549875)
            metricResult.text = String(RIC)
            
            let RICText: String = String(format: "%.9f", RIC)
            metricResult.text = String(RICText)
            
        }
    }
    
    
    @IBAction func numberReset(_ sender: Any) {
        mechanicalResult.text = nil
        electricalResult.text = nil
        metricResult.text = nil
        isNew = true
        enterNumber.text = nil
    }
    

}


