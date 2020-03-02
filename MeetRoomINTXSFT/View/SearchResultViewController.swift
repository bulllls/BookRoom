//
//  SearchResultViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 24/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class SearchResultViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    var viewModel = SearchResultViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        viewModel.networkManajer.getAllRooms { [weak self](rooms) in
            self?.viewModel.allRooms.value = rooms
            self?.viewModel.getResultRooms()
        }
        viewModel.resusltRooms.ignoreNils().observeNext { [weak self] _ in
            self?.table.reloadData()
        }.dispose()
    }
    
    static func storyboardInstance() -> SearchResultViewController? {
        let storyboard = UIStoryboard(name: StoryboardList.result.rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController() as? SearchResultViewController
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.resusltRooms.value?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultViewController", for: indexPath)
        cell.textLabel?.text = viewModel.resusltRooms.value?[indexPath.row].date
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let newStoryBoard : UIStoryboard = UIStoryboard(name: "Result", bundle: nil)
        let vc = newStoryBoard.instantiateViewController(withIdentifier: "DetailResultViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
