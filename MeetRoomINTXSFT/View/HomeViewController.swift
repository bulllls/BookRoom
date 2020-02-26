//
//  HomeViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 22/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    static func storyboardInstance() -> HomeViewController? {
        let storyboard = UIStoryboard(name: StoryboardList.home.rawValue, bundle: nil)
        return storyboard.instantiateInitialViewController() as? HomeViewController
    }

}
