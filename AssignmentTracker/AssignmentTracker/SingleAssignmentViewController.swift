//
//  SingleAssignmentViewController.swift
//  AssignmentTracker
//
//  Created by Max Taylor on 4/27/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit

class SingleAssignmentViewController: UIViewController {

    @IBOutlet weak var assignmentName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subjectName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //assignmentName.delegate = self
        //subjectName.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAssignment(_ sender: Any) {
        let assignmentText = assignmentName.text
        let subject = subjectName.text
        let date = datePicker.date
        
        if let assignment = Assignment(name: assignmentText, subject: subject, date: date) {
            do {
                let managedContext = assignment.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Context could not be saved")
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assignmentName.resignFirstResponder()
        subjectName.resignFirstResponder()
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
