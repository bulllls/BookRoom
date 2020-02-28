//
//  ListTableViewController.swift
//  MeetRoomINTXSFT
//
//  Created by igor.fridrikh on 2/26/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit
import CoreData

class ListTableViewController: UITableViewController, UISplitViewControllerDelegate {
    
    var viewModel = ListViewModel()
    @IBOutlet var listOfRooms: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        try? viewModel.coreDataManager.frc.performFetch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.addBgImage(from: listOfRooms)
        tableView.tableFooterView = UIView()
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            splitViewController?.delegate = self
            print("phone")
        case .pad:
            print("pad")
        default:
            break
        }
        viewModel.coreDataManager.frc.delegate = self
        viewModel.loadRoomData()
        listOfRooms.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coreDataManager.frc.sections?[section].numberOfObjects ?? 0
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let object = viewModel.coreDataManager.frc.object(at: indexPath)
        viewModel.coreDataManager.frc.managedObjectContext.delete(object)
        try? viewModel.coreDataManager.frc.managedObjectContext.save()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionRoomTableViewCell", for: indexPath)
        let object = viewModel.coreDataManager.frc.object(at: indexPath) as? RoomDB
        cell.textLabel?.text = object?.id
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let newStoryBoard : UIStoryboard = UIStoryboard(name: "List", bundle: nil)
          let VC = newStoryBoard.instantiateViewController(withIdentifier: "roomEquipmentStoryboard")
        self.show(VC, sender: Any?.self)
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

extension ListTableViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listOfRooms.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
      switch type {
      case .insert:
        listOfRooms.insertRows(at: [indexPath ?? newIndexPath ?? IndexPath(row: 0, section: 0)], with: .fade)
      case .delete:
        listOfRooms.deleteRows(at: [indexPath!], with: .fade)
      case .move:
        listOfRooms.moveRow(at: indexPath!, to: newIndexPath!)
      case .update:
        listOfRooms.reloadRows(at: [indexPath!], with: .fade)
      @unknown default:
          fatalError()
      }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listOfRooms.endUpdates()
    }
}



