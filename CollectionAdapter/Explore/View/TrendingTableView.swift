//
//  TrendingTableView.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 30/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class TrendingTableView: UITableView {
    private var adapter: ListAdapter?
    func setup(adapter: ListAdapter) {
        self.adapter = adapter
    }
}
