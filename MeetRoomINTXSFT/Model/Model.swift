//
//  Model.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var email: String
    var phone: String?
}

struct Equipment {
    var tableCount: Int
    var chairCount: Int
    var board: Bool
    var tV: Bool
    var printer: Bool
    var conditioning: Bool
    var computer: Bool
}

struct Room {
    var date: Date
    var equipment: Equipment
    var capacityPerson: Int
    var owner: Person?
    var isBooked: Bool
    var image: [Data]?
}
