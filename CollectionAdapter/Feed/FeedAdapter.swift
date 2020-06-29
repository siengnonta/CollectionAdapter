//
//  FeedAdapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class FeedAdapter: AdapterType {
    var dataSource: ListDataSourceType
    var delegate: ListDelegateType
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = dataSource
            tableView?.delegate = delegate
            tableView?.reloadData()
        }
    }
    private(set) var items: [Array<Item>] = [
        [ FeedModel(username: "A", userId: "123", title: "aa"),
          FeedModel(username: "B", userId: "123", title: "bb"),
          FeedModel(username: "C", userId: "123", title: "cc")]
    ]
    
     init(dataSource: ListDataSourceType = ListDataSource(), delegate: ListDelegateType = ListDelegate()) {
        self.dataSource = dataSource
        self.delegate = delegate
        dataSource.adapter = self
        delegate.adapter = self
    }
    
    func cellClass(for indexPath: IndexPath) -> ListableCell.Type {
        if item(at: indexPath) is FeedModel {
            return FeedCell.self
        }
        return EkoTableViewCell.self
    }
    
    func willDisplay(cell: UITableViewCell, at indexPath: IndexPath) {
        guard let item = item(at: indexPath) else {
            return
        }
        if let cell = cell as? ListableCell {
            cell.config(item: item)
        } else {
            // Handle other case
        }
    }
    
    
}
