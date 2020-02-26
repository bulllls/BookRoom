//
//  EquipmentDB+CoreDataProperties.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 26/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension EquipmentDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EquipmentDB> {
        return NSFetchRequest<EquipmentDB>(entityName: "EquipmentDB")
    }

    @NSManaged public var tableCount: String?
    @NSManaged public var chairCount: String?
    @NSManaged public var board: String?
    @NSManaged public var tV: String?
    @NSManaged public var printer: String?
    @NSManaged public var conditioning: String?
    @NSManaged public var computer: String?
    @NSManaged public var room: NSSet?

}

// MARK: Generated accessors for room
extension EquipmentDB {

    @objc(addRoomObject:)
    @NSManaged public func addToRoom(_ value: RoomDB)

    @objc(removeRoomObject:)
    @NSManaged public func removeFromRoom(_ value: RoomDB)

    @objc(addRoom:)
    @NSManaged public func addToRoom(_ values: NSSet)

    @objc(removeRoom:)
    @NSManaged public func removeFromRoom(_ values: NSSet)

}
