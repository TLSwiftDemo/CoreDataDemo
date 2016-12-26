//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Andrew on 2016/11/1.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        context = appDelegate.persistentContainer.viewContext

    
    }

    
    func save() -> Void
    {
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!)
        newUser.setValue("123", forKey: "name")
        newUser.setValue(20, forKey: "age")
        
        do {
            
            try context?.save()
            print("saved data ")
            
        } catch {
            print("error:\(error)")
        }
    }
    
    func createData() -> Void {
        
        
    }
    
    func findDataByStudent(student:Student)  {
        let request = NSFetchRequest<Student>(entityName: "Student")
        request.predicate = NSPredicate(format: "name = %@", student.name!)
        do {
            if let result = (try? context?.fetch(request))??.first{
                if let name = (result as AnyObject).value(forKey: "name") as? String{
                    print("findDataByStudent帮你找到数据了 name = \(name)")
                }
            }
        } catch  {
            
        }
        
        
    }
    func findData(name:String) -> Void {
        
    
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.predicate = NSPredicate(format: "name = %@", name)
        
        do {
            if let result = (try? context?.fetch(request))??.first{
                if let name = (result as AnyObject).value(forKey: "name") as? String{
                    print("帮你找到数据了 name = \(name)")
                }
            }
        } catch  {
            print(error)
        }
        
        
    }
    
    func readData() -> Void {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        request.predicate =  NSPredicate(format: "name <> %@", "")
        
        request.returnsDistinctResults = false
        
        do {
            
            let results = try context?.fetch(request)
            if (results?.count)!>0{
                
                for item in results! {
                    let result = item as! NSManagedObject
                    
                        if let name = result.value(forKey: "name") as? String{
                            print("name = \(name)")
                        }
                        
                        if let age = result.value(forKey: "age") as? Int{
                            print("age:\(age)")
                        }
                    }
                
            }
            
        } catch  {
            print("出错了")
        }
        
        
    }


}

