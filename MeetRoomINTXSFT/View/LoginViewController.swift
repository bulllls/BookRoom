//
//  LoginViewController.swift
//  MeetRoomINTXSFT
//
//  Created by Ruslan Filistovich on 21/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func openURL(_ sender: Any) {
        guard let link = URL(string: "https://docs.swift.org/") else { return }
        let safariVC = SFSafariViewController(url: link)
        safariVC.delegate = self
        self.present(safariVC, animated: true)
    }
}

extension LoginViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
}
