//
//  DataManager.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import Foundation

protocol DataManagerDelegate: class {
    func dataDidChange()
}

class DataManager<T> {
    weak var delegate: DataManagerDelegate?
    var items: [T] = [] {
        didSet {
            delegate?.dataDidChange()
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> T {
        return items[indexPath.row]
    }
}
