//
//  SearchResultViewModel.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 28/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

class SearchResultViewModel: HomeViewModel {
    
    func getResultRooms() {
        var r = [Room]()
        guard let rooms = allRooms.value else { return }
        for room in rooms {
            if room.date != "20200408" {
                r.append(room)
            } else if room.date == "20200408" && room.time != "room.time" {
                r.append(room)
            }
        }
        resusltRooms.value = r
    }
    
}
