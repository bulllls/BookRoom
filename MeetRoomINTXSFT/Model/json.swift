//
//  Json.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 25/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

class Json {
    static let jsonRooms = """
        [
            {
                "id": "123",
                "date": "20200225",
                "capacityPerson": "2",
                "isBooked": "true",
                "image": "Date"
            }, {
                "id": "456",
                "date": "20210716",
                "capacityPerson": "12",
                "isBooked": "false",
                "image": "Date"
            }, {
                "id": "789",
                "date": "20200408",
                "capacityPerson": "5",
                "isBooked": "false",
                "image": "Date"
            },  {
               "id": "321",
               "date": "20220222",
               "capacityPerson": "31",
               "isBooked": "true",
               "image": "Date"
           }
        ]
    """

    static let jsonEquipment = """
        {
            "id": "255",
            "tableCount": "2",
            "chairCount": "10",
            "board": "true",
            "tV": "false",
            "printer": "true",
            "conditioning": "false",
            "computer": "true"
        }
    """

    static let jsonPerson = """
        {
            "name": "Rasl",
            "email": "string@mail.bom",
            "phone": "7788"
        }
    """
}

