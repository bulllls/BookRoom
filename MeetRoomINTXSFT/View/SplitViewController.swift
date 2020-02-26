//
//  SplitViewController.swift
//  MeetRoomINTXSFT
//
//  Created by igor.fridrikh on 2/26/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit
    
class SplitViewDelegate: NSObject, UISplitViewControllerDelegate {
        
        func splitViewController(_ splitViewController: UISplitViewController,
                                 collapseSecondary secondaryViewController: UIViewController,
                                 onto primaryViewController: UIViewController) -> Bool
        {
            guard let navigationController = primaryViewController as? UINavigationController,
                let controller = navigationController.topViewController as? ListTableViewController
            else {
                return true
            }
            
            return controller.collapseDetailViewController
        }
    }
