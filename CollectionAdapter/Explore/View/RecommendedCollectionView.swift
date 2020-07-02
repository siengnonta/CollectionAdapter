//
//  RecommendedCollectionView.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 30/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

typealias EkoCollectionView = UICollectionView & CollectionAttach

protocol CollectionAttach: UICollectionView {
    var adapter: CollectionAdapter? { get set }
    func setup(adapter: CollectionAdapter)
}

extension CollectionAttach {
    func setup(adapter: CollectionAdapter) {
        self.adapter = adapter
        dataSource = adapter.dataSource
        delegate = adapter.delegate
    }
}

class RecommendedCollectionView: EkoCollectionView {
    var adapter: CollectionAdapter?
}
