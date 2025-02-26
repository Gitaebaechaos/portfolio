//
//  SecondViewController.swift
//  Assignment1
//
//  Created by 배기태 on 2021/09/11.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enterNumber: UITextField!
    
    
    @IBOutlet weak var mechanicalResult: UILabel!
    
    @IBOutlet weak var electronicalResult: UILabel!
    
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
            
            
            let RIM: Double = 1 * (newValue * 1000000000 / 745699872)
                
                mechanicalResult.text = String(RIM)

                let RIMText: String = String(format: "%.9f", RIM)
                
                mechanicalResult.text = String(RIMText)
                
            let RIE: Double = 1 * (newValue * 1000 / 746)
            electronicalResult.text = String(RIE)
            
            let RIEText: String = String(format: "%.9f", RIE)
            
            electronicalResult.text = String(RIEText)
            
                let RIC: Double = 1 * (newValue * 100000000 / 73549875)
            metricResult.text = String(RIC)
            
            let RICText: String = String(format: "%.9f", RIC)
            metricResult.text = String(RICText)
            
        }
    
    }
    
    @IBAction func numberReset(_ sender: Any) {
        mechanicalResult.text = nil
        electronicalResult.text = nil
        metricResult.text = nil
        isNew = true
        enterNumber.text = nil
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
