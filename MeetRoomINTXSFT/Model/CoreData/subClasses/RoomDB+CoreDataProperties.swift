//
//  RoomDB+CoreDataProperties.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 26/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension RoomDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomDB> {
        return NSFetchRequest<RoomDB>(entityName: "RoomDB")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: String?
    @NSManaged public var capacityPerson: String?
    @NSManaged public var isBooked: String?
    @NSManaged public var image: String?
    @NSManaged public var equipment: EquipmentDB?
    @NSManaged public var owner: PersonDB?

}
