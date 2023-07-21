//
//  SecondViewController.swift
//  21_06_2023_ForwardDataPassingDemo
//
//  Created by Vishal Jagtap on 21/07/23.
//

import UIKit

//Step 1 : Mentioning a protocol
//protocol BackDataPassingProtocol {
//    func dataToBePassed(text : String)
//}


protocol BackDataPassing2 {
    func dataToBePassed(companyName : String,
                        empId : String,
                        empName : String
                        )
}

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var empIdTextField: UITextField!
    @IBOutlet weak var empNameTextField: UITextField!
    
    var dataContainer : String?

    //Step 2 : creating a property of that protocol
    //var delegate : BackDataPassingProtocol?
    
    var delegate2 : BackDataPassing2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = dataContainer
    
    }
    
    
    @IBAction func btnGoToFVC(_ sender: Any) {
        
        guard let delegateSVC2 = delegate2 else {
            return
        }
        let cmpnyNameExtracted = self.companyNameTextField.text
        let empIdExtracted = self.empIdTextField.text
        let empNameExtracted = self.empNameTextField.text
        
        delegateSVC2.dataToBePassed(
                companyName: cmpnyNameExtracted!,
                empId: empIdExtracted!,
                empName: empNameExtracted!)
        
        navigationController?.popViewController(animated: true)
        
//        guard let delegateOnSVC = delegate else { return
//        }
//
//        let textEnteredByTheUser = self.companyNameTextField.text
//
//       //Step 3 : if delegate exists -- pass textEntered as an argument to the function.
//        delegateOnSVC.dataToBePassed(text:textEnteredByTheUser!)
//
//        navigationController?.popViewController(animated: true)
    }
}
