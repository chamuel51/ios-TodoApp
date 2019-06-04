//
//  ViewController.swift
//  Todoey
//
//  Created by chamuel castillo on 5/7/19.
//  Copyright © 2019 chamuel castillo. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController  {
    
    
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       loadItems()
    
        
        
//                if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//                    itemArray = items
//                }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - TableView Datasource Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
    
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        //itemArray[indexPath.row].setValue("Completed", forKey: "title")
//        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
        
        saveItems()
    
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happens once the user clicks the Add Item button on our UIAlert
            //  print(textField.text)
            
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            
        
            self.saveItems()
            
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - Model Manipulation Methods
    
    func saveItems() {
        
        do{
         try context.save()
        } catch {
       
            print("Error saving context \(error)")
        }
        
        
        self.tableView.reloadData()
        
    }
    
    

    func loadItems(){

    
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        do{
            itemArray = try context.fetch(request)

        } catch {
            print("Error fetching data from context \(error)")
        }

    }
    

    
    
    
    
}

//MARK: - Seach bar methods
extension TodoListViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        request.predicate = predicate
        
        let sortDescriptr = NSSortDescriptor(sortDes  ) 

    }
}
