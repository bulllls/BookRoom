//
//  FilterViewModel.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 24/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class FilterViewModel: HomeViewModel {
    
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
    
    var detailValue: DetailVulue = .date
    
    func chooseDate(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let dateString = formatter.string(from: date as Date)
        guard let intDate = Int(dateString) else { return }
        self.date.value = intDate
        print(dateString)
    }
    
    func chooseTime(from: String?, to: String?) {
        if (from != nil) {
            guard let yourString = from else { return }
            let unsafeChars = CharacterSet.alphanumerics.inverted
            let cleanChars  = yourString.components(separatedBy: unsafeChars).joined(separator: "")
            guard let intDate = Int(cleanChars) else { return }
            fromTime.value = intDate
            print(cleanChars)
        }
        if (to != nil) {
            guard let yourString = to else { return }
            let unsafeChars = CharacterSet.alphanumerics.inverted
            let cleanChars  = yourString.components(separatedBy: unsafeChars).joined(separator: "")
            guard let intDate = Int(cleanChars) else { return }
            toTime.value = intDate
            print(cleanChars)
        }
    }
    
    func chooseCountPerson(index: Int) {
        person.value = index
        print(index)
    }
    
    func chooseQuipment() {
        print("Стол -", isTable.value,
              "Стул -", isChair.value,
              "Кулер -", isCooler.value,
              "Доска -", isBoard.value,
              "Телевизор -", isTv.value,
              "Компьютер -", isComputer.value,
              "Интернет -", isInternet.value,
              "Принтер -", isPrinter.value)
    }
}
