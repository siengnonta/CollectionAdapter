//
//  RecommendedAdapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 30/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class RecommendedAdapter: CollectionAdapter {
    override func initialData() {
        items = [[RecommendedModel(title: "A", subtitle: "a"), RecommendedModel(title: "B", subtitle: "b"), RecommendedModel(title: "C", subtitle: "c")]]
        collectionView?.reloadData()
    }
    
    override func willDisplay(cell: UICollectionViewCell, at indexPath: IndexPath) {
        cell.backgroundColor = .red
    }
}
