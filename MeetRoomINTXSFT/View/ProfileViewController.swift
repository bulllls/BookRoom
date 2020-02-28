//
//  ProfileViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 25/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var currentBookingTableView: UITableView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var viewModel = ProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        currentBookingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "currentBookingTableViewCell")
        viewModel.loadPersonalData()
        viewModel.name.observeNext{ [weak self] value in
            self?.nameOfPerson.text = value
        }.dispose(in: bag)
        viewModel.email.observeNext{ [weak self] value in
            self?.email.text = value
        }.dispose(in: bag)
        viewModel.phoneNumber.observeNext{ [weak self] value in
            self?.mobileNumber.text = value
        }.dispose(in: bag)
    }
    
    @IBAction func bookingHistoryButton(_ sender: Any) {
        let newStoryBoard : UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc = newStoryBoard.instantiateViewController(withIdentifier: "bookingHistoryStoryboard")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currentBookingTableViewCell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "Room"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    



