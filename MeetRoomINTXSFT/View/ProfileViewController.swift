//
//  ProfileViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 25/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var surnameOfPerson: UILabel!
    @IBOutlet weak var department: UILabel!
    @IBOutlet weak var imageOfPerson: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var currentBooking: UILabel!
    @IBOutlet weak var bookingHistory: UILabel!
    @IBOutlet weak var emailContent: UILabel!
    @IBOutlet weak var mobileNumberContent: UILabel!
    @IBOutlet weak var currentBookingTableView: UITableView!
    @IBOutlet weak var bookingHistoryTableView: UITableView!

//    let font = UIFont(name: "Menlo Regular", size: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageOfPerson.layer.cornerRadius = imageOfPerson.frame.size.width/2
        imageOfPerson.layer.borderColor = UIColor.white.cgColor
        currentBookingTableView.delegate = self
        currentBookingTableView.dataSource = self
        currentBookingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CurrentBookingCell")
        bookingHistoryTableView.delegate = self
        bookingHistoryTableView.dataSource = self
        bookingHistoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "BookingHistoryCell")

    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.currentBookingTableView {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentBookingCell", for: indexPath as IndexPath) as UITableViewCell
                cell.textLabel?.text = "Room №3 29.02.2019 15:10"
            cell.textLabel?.textColor = .red
        return cell
        } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "BookingHistoryCell", for: indexPath as IndexPath) as UITableViewCell
                cell.textLabel?.text = "Room №4 28.02.2019 11:10"
//            cell.textLabel?.font = font
        return cell
    }
        }
    
    
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == self.currentBookingTableView {
            if indexPath.row == 0 {
            return 30
        }
        return UITableView.automaticDimension
        } else {
            if indexPath.row == 0 {
            return 30
        }
            return UITableView.automaticDimension
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView == self.currentBookingTableView {
        self.performSegue(withIdentifier: "goToCurrentBookingRoomSegue", sender: indexPath)
        }
    }
    
}

