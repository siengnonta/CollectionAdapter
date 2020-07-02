//
//  CollectionAdapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 29/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

typealias CollectionableCell = UITableViewCell & Configurable

protocol CollectionAdapterType: class {
    var dataSource: CollectionDataSourceType { get }
    var delegate: CollectionDelegateType { get }
    var collectionView: UICollectionView? { get set }
    var items: [Array<Item>] { get }
    
    func initialData()
    func register(cellClasses: [CollectionableCell.Type])
    
    func numberOfSections() -> Int
    func numberOfRow(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> Item?
    func cellClass(for indexPath: IndexPath) -> CollectionableCell.Type
    func willDisplay(cell: UICollectionViewCell, at indexPath: IndexPath)
    
    func didSelectRow(at indexPath: IndexPath)
}

extension CollectionAdapterType {
    func register(cellClasses: [CollectionableCell.Type]) {
        for cellClass in cellClasses {
//            collectionView?.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
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

class CollectionAdapter: CollectionAdapterType {
    let dataSource: CollectionDataSourceType
    let delegate: CollectionDelegateType
    weak var collectionView: UICollectionView? {
        didSet {
            initialData()
        }
    }
    var items: [Array<Item>] = []
    
    func initialData() {
        //
    }
    
    init(dataSource: CollectionDataSourceType = CollectionDataSource(), delegate: CollectionDelegateType = CollectionDelegate()) {
        self.dataSource = dataSource
        self.delegate = delegate
        dataSource.adapter = self
        delegate.adapter = self
    }
    
    func cellClass(for indexPath: IndexPath) -> CollectionableCell.Type {
        return EkoCollectionViewCell.self
    }
    
    func willDisplay(cell: UICollectionViewCell, at indexPath: IndexPath) {
        
    }
    
}

class EkoCollectionViewCell: CollectionableCell {
    func config(item: Item) {
        //
    }
}
