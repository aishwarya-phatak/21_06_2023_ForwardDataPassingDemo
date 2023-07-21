//
//  ViewController.swift
//  21_06_2023_ForwardDataPassingDemo
//
//  Created by Vishal Jagtap on 21/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var empIdLabel: UILabel!
    @IBOutlet weak var empNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func moveToSVC(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.dataContainer = self.nameTextField.text
        //Step 6 : Assign delegate property top current instance of ViewController
        //secondViewController.delegate = self
        secondViewController.delegate2 = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

//MARK : Step 4 : Conforming to the Protocol

//extension ViewController : BackDataPassingProtocol{
//    //Step 5 : Assigning text to labels' text property
//    func dataToBePassed(text: String) {
//        self.companyNameLabel.text = text
//    }
//}

extension ViewController : BackDataPassing2{
    func dataToBePassed(companyName: String,
                        empId: String,
                        empName: String) {
        self.companyNameLabel.text = companyName
        self.empIdLabel.text = empId
        self.empNameLabel.text = empName
    }
}
