//
//  Entity+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Andrew on 2016/11/2.
//  Copyright © 2016年 Andrew. All rights reserved.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var age: Int32
    @NSManaged public var name: String?

}
