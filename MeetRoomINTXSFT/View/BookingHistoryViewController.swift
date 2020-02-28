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
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.addBgImage(from: historyTableView)
        historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "historyBookingTableViewCell")
    }
    
}

extension BookingHistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyBookingTableViewCell", for: indexPath)
        cell.textLabel?.text = "Room №4"
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




