//
//  ListAdapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

protocol Item { }
protocol Configurable {
    func config(item: Item)
}

typealias ListableCell = UITableViewCell & Configurable

protocol ListAdapterType: class {
    var dataSource: ListDataSourceType { get }
    var delegate: ListDelegateType { get }
    var tableView: UITableView? { get set }
    var items: [Array<Item>] { get }
    
    func register(cellClasses: [ListableCell.Type])
    
    func numberOfSections() -> Int
    func numberOfRow(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Item?
    func cellClass(for indexPath: IndexPath) -> ListableCell.Type
    func willDisplay(cell: UITableViewCell, at indexPath: IndexPath)
    
    func didSelectRow(at indexPath: IndexPath)
}

extension ListAdapterType {
    func register(cellClasses: [ListableCell.Type]) {
        for cellClass in cellClasses {
            tableView?.register(cellClass: cellClass.self)
        }
    }
    
    func item(at indexPath: IndexPath) -> Item? {
        guard 0..<items.count ~= indexPath.section,
            0..<items[indexPath.section].count ~= indexPath.row else {
                return nil
        }
        return items[indexPath.section][indexPath.row]
    }
    
    func numberOfSections() -> Int {
        return items.count
    }
    
    func numberOfRow(in section: Int) -> Int {
        guard 0..<items.count ~= section else {
            return NSNotFound
        }
        return items[section].count
    }
    
    // Delegate
    func didSelectRow(at indexPath: IndexPath) {
        print("Select \(indexPath.section) - \(indexPath.row)")
    }
    
}

class ListAdapter: ListAdapterType {
    let dataSource: ListDataSourceType
    let delegate: ListDelegateType
    weak var tableView: UITableView?
    private(set) var items: [Array<Item>] = []
    
    init(dataSource: ListDataSourceType = ListDataSource(), delegate: ListDelegateType = ListDelegate()) {
        self.dataSource = dataSource
        self.delegate = delegate
        dataSource.adapter = self
        delegate.adapter = self
    }
    
    func cellClass(for indexPath: IndexPath) -> ListableCell.Type {
        return EkoTableViewCell.self
    }
    
    func willDisplay(cell: UITableViewCell, at indexPath: IndexPath) {
        
    }
    
}

class EkoTableViewCell: ListableCell {
    func config(item: Item) {
        
    }
}
