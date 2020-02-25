//
//  FilterViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 24/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class FilterViewController: UIViewController {
    @IBOutlet weak var insLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var equipmentList: UIView!
    @IBOutlet weak var isTable: UISwitch!
    @IBOutlet weak var isChair: UISwitch!
    @IBOutlet weak var isCooler: UISwitch!
    @IBOutlet weak var isBoard: UISwitch!
    @IBOutlet weak var isTv: UISwitch!
    @IBOutlet weak var isComputer: UISwitch!
    @IBOutlet weak var isInternet: UISwitch!
    @IBOutlet weak var isPrinter: UISwitch!
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    var viewModel = FilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func displayNeedElement() {
        switch viewModel.detailValue {
        case .date:
            viewModel.detailValue = .time
            datePicker.isHidden = true
            picker.isHidden = false
            cancel.title = "Отмена"
            viewModel.chooseDate(date: datePicker.date)
        case .time:
            viewModel.detailValue = .countPeople
        case .countPeople:
            viewModel.detailValue = .equipment
            picker.isHidden = true
            equipmentList.isHidden = false
        case .equipment:
            viewModel.detailValue = .date
            equipmentList.isHidden = true
            datePicker.isHidden = false
            viewModel.isBoard.value = isBoard.isOn
            viewModel.isTv.value = isTv.isOn
            viewModel.isChair.value = isChair.isOn
            viewModel.isTable.value = isTable.isOn
            viewModel.isCooler.value = isCooler.isOn
            viewModel.isPrinter.value = isPrinter.isOn
            viewModel.isComputer.value = isComputer.isOn
            viewModel.isInternet.value = isInternet.isOn
            viewModel.chooseQuipment()
            guard let vc = SearchResultViewController.storyboardInstance() else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func choose(_ sender: UIButton) {
        displayNeedElement()
        insLabel.text = viewModel.detailValue.rawValue
        picker.reloadAllComponents()
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        sender.title = ""
    }
    
    @IBAction func date(_ sender: UIDatePicker) {
        viewModel.chooseDate(date: sender.date)
    }
    
}

extension FilterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch viewModel.detailValue {
        case .time:
            return 2
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch viewModel.detailValue {
        case .time:
            return pickerTimeValue.count
        default:
            return pickerPersonValue.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch viewModel.detailValue {
        case .time:
            switch component {
            case 0:
                return "c " + pickerTimeValue[row]
            default:
                return "до " + pickerTimeValue.reversed()[row]
            }
        default:
            return pickerPersonValue[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch viewModel.detailValue {
        case .time:
            switch component {
            case 0:
                viewModel.chooseTime(from: nil, to: pickerTimeValue[row])
            default:
                viewModel.chooseTime(from: pickerTimeValue.reversed()[row], to: nil)
            }
        default:
            viewModel.chooseCountPerson(index: pickerPersonValue.firstIndex(of: pickerPersonValue[row]) ?? 0)
        }
    }
}
