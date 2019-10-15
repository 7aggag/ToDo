//
//  FirstViewController.swift
//  todo
//
//  Created by mohamed haggag on 8/3/19.
//  Copyright © 2019 mohamed haggag. All rights reserved.
//

import UIKit

var tasks :[String]=[]
class FirstViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "todocell")
        
        
     
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
        
    }
    
    
    

    @IBOutlet weak var todolist: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todolist.dataSource=self
        todolist.delegate=self
        
        
     
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let task = UserDefaults.standard.object(forKey: "taskarr")
        if let taskitem = task
        {
            tasks = taskitem as! [String]
        }
        todolist.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            tasks.remove(at: indexPath.row)
            UserDefaults.standard.set(tasks, forKey: "taskarr")
            todolist.reloadData()
        }
        
    }

}

