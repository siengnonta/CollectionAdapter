//
//  CategoriesCollectionView.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 30/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class CategoriesCollectionView: UICollectionView {
    private var adapter: CollectionAdapter?
    func setup(adapter: CollectionAdapter) {
        self.adapter = adapter
        dataSource = adapter.dataSource
        delegate = adapter.delegate
    }
}
