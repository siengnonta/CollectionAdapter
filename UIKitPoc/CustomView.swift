//
//  CustomView.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 2/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit


protocol TrendingViewDelegate: class {
    func didSelectRow(at indexPath: IndexPath)
    func didJoin(item: Any)
}

class TrendingView: UIView, AdapterViewType {
    
    private let view = UIView(frame: .zero)
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    weak var delegate: TrendingViewDelegate?
    
    var adapter: ListAdapterType
    
    required init(adapter: ListAdapterType = ListAdapter()) {
        self.adapter = adapter
        super.init(frame: .zero)
        
        self.adapter.tableView = tableView
        self.adapter.delegate = self
        
        addConstriants()
    }
    
    private func addConstriants() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrendingView: AdapterDelegate {
    
    func didSelectRow(at indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
    
    func reachBottom() {
        // laod more
    }
    
}
