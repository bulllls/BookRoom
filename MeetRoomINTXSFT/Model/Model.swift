//
//  Model.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

struct Person: Codable {
    var name: String
    var email: String
    var phone: String?
}

struct Equipment: Codable {
    var tableCount: String
    var chairCount: String
    var board: String
    var tV: String
    var printer: String
    var conditioning: String
    var computer: String
}

struct Room: Codable {
    var time: String
    var date: String
    var equipment: Equipment?
    var capacityPerson: String
    var owner: Person?
    var isBooked: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case time = "id"
       case date
       case equipment
       case capacityPerson
       case owner
       case isBooked
       case image
    }
}

struct BooTime {
    var fromeTime: Int
    var toTime: Int
}

enum DetailVulue: String {
    case date = "Дата:"
    case time = "Промежуток времени:"
    case countPeople = "Количество человек:"
    case equipment = "Необходимое оборудование:"
}

enum StoryboardList: String {
    case auth = "Auth"
    case home = "Home"
    case result = "Result"
    case filter = "Filter"
    case profile = "Profile"
    case list = "List"
}

let pickerTimeValue = ["1:00", "2:00", "3:00", "4:00", "5:00", "6:00", "7:00", "8:00", "9:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00", "24:00"]
let pickerPersonValue = ["1 человек", "до 5 человек", "больше 5 человек", "до 10 человек", "больше 10 человек"]
