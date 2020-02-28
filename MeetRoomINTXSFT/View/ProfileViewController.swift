//
//  ProfileViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 25/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var network = Network()


    @IBOutlet weak var imageOfPerson: UIImageView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var contentOfNameOfPerson: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var contentOfMobileNumber: UILabel!
    @IBOutlet weak var currentTableView: UITableView!
    @IBOutlet weak var contentOfEmail: UILabel!
    

    
    @IBAction func historyBookingsList(_ sender: Any) {         performSegue(withIdentifier: "goToCurrentBooking", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTableView.backgroundColor = .clear

        currentTableView.delegate = self
        currentTableView.dataSource = self
        currentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "currentTableViewCell")
        loadPersonName()
        
    }
   func loadPersonName() {
        
        network.getPersonInfo { [weak self] (person) in
            self?.contentOfNameOfPerson.text = person.name
            self?.contentOfMobileNumber.text = person.phone
            self?.contentOfEmail.text = person.email
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "currentTableViewCell", for: indexPath as IndexPath) as UITableViewCell
                cell.textLabel?.text = "Room №4 28.02.2019 15:10"
            cell.textLabel?.textColor = .red
            cell.textLabel?.font = UIFont(name: "Avenir", size: 14)
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


