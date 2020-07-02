//
//  ListDataSource.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

protocol ListDataSourceType: NSObject, UITableViewDataSource {
    var adapter: ListAdapterType? { get set }
}

protocol ListDelegateType: NSObject, UITableViewDelegate {
    var adapter: ListAdapterType? { get set }
}

class ListDataSource: NSObject, ListDataSourceType {
    weak var adapter: ListAdapterType?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let adapter = adapter else {
            fatalError()
        }
        return adapter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let adapter = adapter else {
            fatalError()
        }
        let cellClass = adapter.cellClass(for: indexPath)
        return tableView.dequeue(cellClass: cellClass, forIndexPath: indexPath)
    }
    
}

class ListDelegate: NSObject, ListDelegateType {
    weak var adapter: ListAdapterType?
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let adapter = adapter else {
            fatalError()
        }
        adapter.willDisplay(cell: cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        adapter?.didSelectRow(at: indexPath)
    }
}


