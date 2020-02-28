//
//  BookingHistoryViewController.swift
//  MeetRoomINTXSFT
//
//  Created by igor.fridrikh on 2/28/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class BookingHistoryViewController: UIViewController {
    
    @IBOutlet weak var bookingHistoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bookingHistoryTableView.delegate = self
        bookingHistoryTableView.dataSource = self
        bookingHistoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "bookingHistoryTableViewCell")    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookingHistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "bookingHistoryTableViewCell", for: indexPath as IndexPath) as UITableViewCell
                cell.textLabel?.text = "Room №3 25.02.2019 9:10"
            cell.textLabel?.textColor = .red
            cell.textLabel?.font = UIFont(name: "Avenir", size: 14)
            cell.backgroundColor = .clear
        return cell
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
