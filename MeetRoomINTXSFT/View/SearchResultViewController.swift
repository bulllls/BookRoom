//
//  SearchResultViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 24/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit
import CoreData

class SearchResultViewController: UITableViewController {

    @IBOutlet var table: UITableView!
    var dataBaseManager = DataBase()
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
        try? dataBaseManager.frc.performFetch()
        print("Will")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataBaseManager.frc.delegate = self
        /// временная кнопка для проберки работы базы данных
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped)), animated: false)
    }
    
    static func storyboardInstance() -> SearchResultViewController? {
        let storyboard = UIStoryboard(name: StoryboardList.result.rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController() as? SearchResultViewController
    }

    /// тестовое получение всех переговорок и сохрание в базу(по образцу добавить в LISTViewController, отсюда удалить)
    @objc func addTapped() {
        let networkManager = Network()
        networkManager.getAllRooms { [weak self] (rooms) in
            self?.dataBaseManager.saveNewRoom(rooms: rooms)
        }
        print("test tap")
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBaseManager.frc.sections?[section].numberOfObjects ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = dataBaseManager.frc.object(at: indexPath) as? RoomDB
        cell.textLabel?.text = object?.id
        return cell
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension SearchResultViewController: NSFetchedResultsControllerDelegate {
    ///показываю что начато редактирование ячейки
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        table.beginUpdates()
    }
    ///определяет что именно хочу сделать с ячейкой
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
      switch type {
      case .insert:
        table.insertRows(at: [indexPath ?? newIndexPath ?? IndexPath(row: 0, section: 0)], with: .fade)
      case .delete:
        table.deleteRows(at: [indexPath!], with: .fade)
      case .move:
        table.moveRow(at: indexPath!, to: newIndexPath!)
      case .update:
        table.reloadRows(at: [indexPath!], with: .fade)
      @unknown default:
          fatalError()
      }
    }
    /// показываю что редактировние ячейки окончено
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        table.endUpdates()
    }
}
