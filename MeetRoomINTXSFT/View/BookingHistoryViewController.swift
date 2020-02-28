//
//  BookingHistoryViewController.swift
//  MeetRoomINTXSFT
//
//  Created by igor.fridrikh on 2/28/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class BookingHistoryViewController: UIViewController {

    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "historyBookingTableViewCell")
    }

}

extension BookingHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyBookingTableViewCell", for: indexPath)
        cell.textLabel?.text = "Room №4 27.02.2019 15:10"
        return cell
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
}

extension BookingHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


