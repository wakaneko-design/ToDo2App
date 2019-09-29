//
//  ViewController.swift
//  ToDo2App
//
//  Created by Yuto Wakabayashi on 2019/09/28.
//  Copyright © 2019 com.litech. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itemArray:[Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let item1 : Item = Item(title: "明日のご飯買う！")
        let item2 : Item = Item(title: "眠い！")
        let item3 : Item = Item(title: "デデニー行きたい！")
        
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell",for:indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark: .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        item.done = !item.done
        self.tableView.reloadData()
        
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "アイテムを追加", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "リストに追加", style: .default) { (action) in
            
            let newItem: Item = Item(title: textField.text!)
                
            self.itemArray.append(newItem)
            self.tableView.reloadData()
        
    }
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "NEWアイテム"
            textField = alertTextField
        }
    
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
}

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}
