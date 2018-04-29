//
//  AssignmentTrackerViewController.swift
//  AssignmentTracker
//
//  Created by Max Taylor on 4/27/18.
//  Copyright © 2018 Max Taylor. All rights reserved.
//

import UIKit
import CoreData

class AssignmentTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var assignmentTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var assignments = [Assignment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Assignment> = Assignment.fetchRequest()
        
        do {
            assignments = try managedContext.fetch(fetchRequest)
            
            assignmentTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }
    
    @IBAction func addNewAssignment(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignmentTableView.dequeueReusableCell(withIdentifier: "assignmentCell", for: indexPath)
        let assignment = assignments[indexPath.row]
        
        cell.textLabel?.text = assignment.assignmentName
        
        if let date = assignment.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        }
        
        return cell
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
