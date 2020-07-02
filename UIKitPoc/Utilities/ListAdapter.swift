//
//  ListAdapter.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 1/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//
  
import UIKit

protocol ModelType { }

protocol ListAdapterType {
    var tableView: UITableView? { get set }
    var delegate: AdapterDelegate? { get set }
    var cellTypes: [UITableViewCell.Type] { get set }
    func register(cellTypes: [UITableViewCell.Type])
    func feed(items: [ModelType])
}

protocol AdapterViewType {
    init(adapter: ListAdapterType)
}

protocol AdapterDelegate: class {
    func didSelectRow(at indexPath: IndexPath)
    func reachBottom()
}

class ListAdapter: ListAdapterType {
    
    weak var delegate: AdapterDelegate?
    var cellTypes: [UITableViewCell.Type] = [UITableViewCell.self]
    
    private var items: [ModelType] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var adapterDataSource: ListAdapterDataSource? {
        didSet {
            print("set datasource")
            adapterDataSource?.setup(adapter: self)
            tableView?.dataSource = adapterDataSource
        }
    }
    
    private var adapterDelegate: ListAdapterDelegate? {
        didSet {
            print("set delegate")
            adapterDelegate?.setup(adapter: self)
            tableView?.delegate = adapterDelegate
        }
    }
    
    var tableView: UITableView? {
        didSet {
            print("set tableView")
            tableView?.dataSource = adapterDataSource
            tableView?.delegate = adapterDelegate
        }
    }
    
    init(dataSource: ListAdapterDataSource = ListAdapterDataSource(), delegate: ListAdapterDelegate = ListAdapterDelegate()) {
        setDataSource(newValue: dataSource)
        setDelegate(newValue: delegate)
    }
    
    private func setDataSource(newValue: ListAdapterDataSource) {
        self.adapterDataSource = newValue
    }
    
    private func setDelegate(newValue: ListAdapterDelegate) {
        self.adapterDelegate = newValue
    }
    
    func register(cellTypes: [UITableViewCell.Type]) {
        for type in cellTypes {
            tableView?.register(type.self, forCellReuseIdentifier: NSStringFromClass(type))
        }
    }
    
    // public
    func feed(items: [ModelType]) {
        self.items = items
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> ModelType {
        return items[indexPath.row]
    }
    
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        return cell
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
    
}

class ListAdapterDataSource: NSObject, UITableViewDataSource {
    
    private weak var adapter: ListAdapter?
    func setup(adapter: ListAdapter) {
        self.adapter = adapter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adapter?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return adapter?.cellForRow(at: indexPath) ?? UITableViewCell()
    }
    
}

class ListAdapterDelegate: NSObject, UITableViewDelegate {
    
    private weak var adapter: ListAdapter?
    func setup(adapter: ListAdapter) {
        self.adapter = adapter
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        adapter?.didSelectRow(at: indexPath)
    }
    
}

class PurpleListAdapter: ListAdapter {
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemPurple
        cell.selectionStyle = .none
        return cell
    }
}

