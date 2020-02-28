//
//  HomeViewModel.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class HomeViewModel {
    
    let disposeBag = DisposeBag()
    
    let date = Observable<Int>(0)
    let fromTime = Observable<Int>(100)
    let toTime = Observable<Int>(2400)
    let person = Observable<Int>(0)
    let isTable = Observable<Bool>(true)
    let isChair = Observable<Bool>(true)
    let isCooler = Observable<Bool>(false)
    let isBoard = Observable<Bool>(false)
    let isTv = Observable<Bool>(true)
    let isComputer = Observable<Bool>(false)
    let isInternet = Observable<Bool>(true)
    let isPrinter = Observable<Bool>(true)
    let allRooms = Observable<[Room]?>(nil)
    let resusltRooms = Observable<[Room]?>(nil)
    
    var coreDataManager = DataBase()
    var networkManajer = Network()
    
    func addBgImage(from: UITableView){
        let image = UIImage(named: "bg")
        let imageView = UIImageView(image: image)
        from.backgroundView = imageView
        
    }
}
