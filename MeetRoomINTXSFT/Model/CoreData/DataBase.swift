//
//  DataBase.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 26/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataBase {
    lazy var frc: NSFetchedResultsController<NSManagedObject> = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "RoomDB")
        ///сортирую данные по ключу date
        let descriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [descriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }()
    
    ///сохраняю в базу переговорки
    func saveNewRoom(rooms: [Room]) {
        for room in rooms {
            let newTask = RoomDB(context: frc.managedObjectContext)
            newTask.id = room.id
            newTask.date = room.date
            newTask.image = room.image
            newTask.isBooked = room.isBooked
            try? frc.managedObjectContext.save()
        }
    }
}

