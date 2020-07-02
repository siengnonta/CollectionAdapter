//
//  CollectionDataSource.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 29/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

protocol CollectionDataSourceType: NSObject, UICollectionViewDataSource {
    var adapter: CollectionAdapterType? { get set }
}

protocol CollectionDelegateType: NSObject, UICollectionViewDelegate {
    var adapter: CollectionAdapterType? { get set }
}

class CollectionDataSource: NSObject, CollectionDataSourceType {
    weak var adapter: CollectionAdapterType?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let adapter = adapter else {
            fatalError()
        }
        return adapter.numberOfRow(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let adapter = adapter else {
            fatalError()
        }
        let cellClass = adapter.cellClass(for: indexPath)
//        return collectionView.dequeue(cellClass: cellClass, forIndexPath: indexPath)
        fatalError()
    }
    
}

class CollectionDelegate: NSObject, CollectionDelegateType {
    weak var adapter: CollectionAdapterType?
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let adapter = adapter else {
            fatalError()
        }
        adapter.willDisplay(cell: cell, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        adapter?.didSelectRow(at: indexPath)
    }
}
