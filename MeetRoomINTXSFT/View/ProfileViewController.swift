//
//  ProfileViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 25/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var networkManager = Network()

    @IBOutlet weak var currentBookingTableView: UITableView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    

    @IBAction func bookingHistoryButton(_ sender: Any) {
      let newStoryBoard : UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let VC = newStoryBoard.instantiateViewController(withIdentifier: "bookingHistoryStoryboard")
        self.present(VC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentBookingTableView.delegate = self
        currentBookingTableView.dataSource = self
        currentBookingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "currentBookingTableViewCell")
        currentBookingTableView.backgroundColor = .clear
        
        loadPersonalData()
    }
    
    func loadPersonalData() {
        networkManager.getPersonInfo() { [weak self] (person) in
            self?.nameOfPerson.text = person.name
            self?.email.text = person.email
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentBookingTableViewCell", for: indexPath)
        cell.textLabel?.text = "Room №3 29.02.2019 15:10"
        cell.textLabel?.textColor = .red
        cell.backgroundColor = .clear
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


