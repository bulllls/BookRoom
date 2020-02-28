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
    
    var dataBaseManager = DataBase()
    var viewModel = HomeViewModel()
    @IBOutlet var listOfRooms: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        try? dataBaseManager.frc.performFetch()
        listOfRooms.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.addBgImage(from: listOfRooms)
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            splitViewController?.delegate = self
            print("phone")
        case .pad:
            print("pad")
        default:
            break
        }
        dataBaseManager.frc.delegate = self
        //loadRoomData()
    }
    
    @objc func loadRoomData() {
        let networkManager = Network()
        networkManager.getAllRooms { [weak self] (rooms) in
            self?.dataBaseManager.saveNewRoom(rooms: rooms)
        }
        print("test listTableTap")
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBaseManager.frc.sections?[section].numberOfObjects ?? 0

    }
    
    /// разрешаю редактировать ячейку
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      return true
    }
    /// удаляю выбранную ячейку
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let object = dataBaseManager.frc.object(at: indexPath)
        dataBaseManager.frc.managedObjectContext.delete(object)
        try? dataBaseManager.frc.managedObjectContext.save()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionRoomTableViewCell", for: indexPath)
        let object = dataBaseManager.frc.object(at: indexPath) as? RoomDB
        cell.textLabel?.text = object?.id
        cell.backgroundColor = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

extension ListTableViewController: NSFetchedResultsControllerDelegate {
    ///показываю что начато редактирование ячейки
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listOfRooms.beginUpdates()
    }
    ///определяет что именно хочу сделать с ячейкой
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
    /// показываю что редактировние ячейки окончено
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        listOfRooms.endUpdates()
    }
}



