//
//  ProfileViewModel.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 28/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond
import UIKit

class ProfileViewModel: HomeViewModel {
    
    let name = Observable<String>("")
    let phoneNumber = Observable<String?>(nil)
    let email = Observable<String>("")
    
    func loadPersonalData() {
        networkManajer.getPersonInfo() { [weak self] (person) in
            self?.name.value = person.name
            self?.email.value = person.email
            self?.phoneNumber.value = person.phone
        }
    }
}
