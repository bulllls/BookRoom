//
//  Network.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

class Network {
    func getAllRooms(completion: @escaping ([Room]) -> Void){
        if let json = Json.jsonRooms.data(using: .utf8) {
            let decoder = JSONDecoder()
            do {
                let rooms = try decoder.decode([Room].self, from: json)
                completion(rooms)
                for room in rooms { print(room.isBooked) }
            } catch { print(error.localizedDescription) }
        }
    }
    
    func getAllEquipment(completion: @escaping (Equipment) -> Void){
        if let json = Json.jsonEquipment.data(using: .utf8) {
            let decoder = JSONDecoder()
            do {
                let equipment = try decoder.decode(Equipment.self, from: json)
                completion(equipment)
                print(equipment.computer)
            } catch { print(error.localizedDescription) }
        }
    }
    
    func getPersonInfo(completion: @escaping (Person) -> Void){
        if let json = Json.jsonPerson.data(using: .utf8) {
            let decoder = JSONDecoder()
            do {
                let person = try decoder.decode(Person.self, from: json)
                completion(person)
                print(person.name)
            } catch { print(error.localizedDescription) }
        }
    }
}
