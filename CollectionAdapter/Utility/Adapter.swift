//
//  Adapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class Adapter<T>: NSObject, UITableViewDataSource, UITableViewDelegate, DataManagerDelegate {
    let dataManager: DataManager<T>
    weak var tableView: UITableView?
    
    init(dataManager: DataManager<T>) {
        self.dataManager = dataManager
        super.init()
        self.dataManager.delegate = self
    }
    
    func setup(in tableView: UITableView, cellClasses: [UITableViewCell.Type]) {
        // register cell
        for cellCalss in cellClasses {
            tableView.register(cellClass: cellCalss.self)
        }
        self.tableView = tableView
    }
    
    // MARK: - TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Still stuck over here for generic type
        let cell = tableView.dequeue(cellClass: FeedCell.self)
        if let item = dataManager.item(at: indexPath) as? FeedModel {
            cell.configure(item, at: indexPath)
        }
        return cell
    }
    
    // MARK: - DataManager Delegate
    
    func dataDidChange() {
        tableView?.reloadData()
    }
    
}
