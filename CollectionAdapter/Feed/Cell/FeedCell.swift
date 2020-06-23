//
//  FeedCell.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell, ConfigurableCell {
    
//    @IBOutlet private var usernameLabel: UILabel!
//    @IBOutlet private var titleLabel: UILabel!
    
    typealias T = FeedModel
    
    func configure(_ item: FeedModel, at indexPath: IndexPath) {
        textLabel?.text = item.username
        detailTextLabel?.text = item.title
    }
}

