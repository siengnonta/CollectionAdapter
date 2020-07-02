//
//  MainViewController.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 2/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chatHomeViewController = EkoChatHomeViewController.createInstance(style: ViewStyle(backgroundColor: .systemGray2))
        chatHomeViewController.viewProvider = self
        chatHomeViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: chatHomeViewController)
        present(navigationController, animated: true, completion: nil)
    }
}

extension MainViewController: EkoChatHomeViewProvider {
    func viewForRecents() -> EkoViewPagerTab? {
        return EkoViewPagerTab(viewController: EkoRecentChatViewController(), identifier: "Recent")
    }
    
    func viewForDirectory() -> EkoViewPagerTab? {
        return nil
    }
}

extension MainViewController: EkoChatHomeViewControllerDelegate {
    func ekoChatHome(_ controller: EkoChatHomeViewController, action: EkoChatHomeViewController.Action) {
        
    }
    
    
}

enum EkoMessageType {
    case text
    case image
    case file
}

