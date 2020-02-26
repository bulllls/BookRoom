//
//  PersonDB+CoreDataProperties.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 26/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonDB> {
        return NSFetchRequest<PersonDB>(entityName: "PersonDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var room: NSSet?

}

// MARK: Generated accessors for room
extension PersonDB {

    @objc(addRoomObject:)
    @NSManaged public func addToRoom(_ value: RoomDB)

    @objc(removeRoomObject:)
    @NSManaged public func removeFromRoom(_ value: RoomDB)

    @objc(addRoom:)
    @NSManaged public func addToRoom(_ values: NSSet)

    @objc(removeRoom:)
    @NSManaged public func removeFromRoom(_ values: NSSet)

}
