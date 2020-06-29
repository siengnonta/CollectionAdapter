//
//  FeedViewController.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var adapter: AdapterType = FeedAdapter()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        adapter.tableView = tableView
        adapter.register(cellClasses: [FeedCell.self])
    }

}

// View Controller
protocol AdapterAttachable: UIViewController {
    var adapter: AdapterType? { get set }
}
