//
//  EkoChatHomeViewController.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 2/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

struct EkoViewPagerTab {
    let viewController: UIViewController
    let identifier: String
}

protocol EkoChatHomeViewProvider {
    func viewForRecents() -> EkoViewPagerTab?
    func viewForDirectory() -> EkoViewPagerTab?
}

protocol EkoChatHomeViewControllerDelegate {
    func ekoChatHome(_ controller: EkoChatHomeViewController,
                     action: EkoChatHomeViewController.Action)
}

class EkoChatHomeViewController: UIViewController {
    enum Action {
        case search
        case newChat
    }
    
    var viewProvider: EkoChatHomeViewProvider?
    var delegate: EkoChatHomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func createInstance(style: ViewStyle) -> EkoChatHomeViewController {
        return EkoChatHomeViewController()
    }
}
