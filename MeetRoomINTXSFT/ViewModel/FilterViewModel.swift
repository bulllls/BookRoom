//
//  FilterViewModel.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 24/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation

class FilterViewModel: HomeViewModel {
    
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
