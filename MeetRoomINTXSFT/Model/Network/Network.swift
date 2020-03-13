//
//  Network.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

class Network {
    //   let Profile = try? newJSONDecoder().decode(Profile.self, from: jsonData)
    var options = [String:String]()
       //method: 'GET',
       //url: '/rest/api/3/myself',
       //auth: username: 'email@example.com', password: '<api_token>',
       //headers: 'Accept': 'application/json'
       
    //The URIs for resources have the following structure:

    //https://<site-url>/rest/api/3/<resource-name>

   // For example, https://your-domain.atlassian.net/rest/api/3/issue/DEMO-1
    
    func sendRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
        var components = URLComponents(string: url)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        let request = URLRequest(url: components.url!)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }

            let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
            completion(responseObject, nil)
        }
        task.resume()
    }
    
    
    
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
