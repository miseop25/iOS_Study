//
//  ViewController.swift
//  CoreDataStudy
//
//  Created by Minseop Kim on 2020/08/03.
//  Copyright © 2020 Minseop Kim. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext{
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        return app.persistentContainer.viewContext
    }

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    
    @IBAction func createEntity(_ sender: Any) {
        guard let name = nameField.text else {return}
        guard let val = ageField.text, let age = Int(val) else {return}
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        
//        변경사항이 있는지 확인하는 것
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            }catch {
                print("Error")
            }
        }
        
        nameField.text = nil
        ageField.text = nil
    }
    
    @IBAction func readEntity(_ sender: Any) {
//        저장소에서 읽어오는 과정을 Fetch라고 한다.
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        do {
            let list = try context.fetch(request)
            
            if let first = list.first {
                nameField.text = first.value(forKey: "name") as? String
                if let age = first.value(forKey: "age") as? Int{
                    ageField.text = "\(age)"
                }
                
                editTarget = first
                
                
            }else {
                print("notFounded")
            }
        }catch {
            
        }
    }
    
    var editTarget: NSManagedObject?
    
    @IBAction func updateEntity(_ sender: Any) {
        guard let name = nameField.text else {return}
        guard let val = ageField.text, let age = Int(val) else {return}
        
        if let target = editTarget {
            target.setValue(name, forKey: "name")
            target.setValue(age, forKey: "age")
        }
        
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            }catch {
                print("Error")
            }
        }
        
        nameField.text = nil
        ageField.text = nil
    }
    
    
    @IBAction func deleteEntity(_ sender: Any) {
        if let target = editTarget {
            context.delete(target)
        }
        
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            }catch {
                print("Error")
            }
        }
        
        nameField.text = nil
        ageField.text = nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

