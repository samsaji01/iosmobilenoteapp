//
//  ViewController.swift
//  NotesApp
//
//  Created by user198875 on 8/5/21.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var taskArray = [String]()

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = taskArray[indexPath.row]
        return cell
    }
    
        @IBAction func onAddClick(_ sender: Any) {
            
            var inputTextField = UITextField()
            
            let alert = UIAlertController(title: "Add Note", message: "", preferredStyle: .alert)

            alert.addTextField { (textField) in
                inputTextField = textField
                inputTextField.placeholder = "Write a Note"
            }
            
            let ok = UIAlertAction(title: "OK", style: .default) { (alertAction) in
                self.taskArray.append(inputTextField.text!)
                self.myTableView.reloadData()
            }
            
            alert.addAction(ok)
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in }
            alert.addAction(cancel)
                    
            self.present(alert, animated: true, completion: nil)
        }
    
}
