//
//  FeedCell.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class FeedCell: ListableCell {
    
    func config(item: Item) {
        guard let item = item as? FeedModel else {
            fatalError()
        }
        textLabel?.text = item.title
        detailTextLabel?.text = item.username
    }
    
}

