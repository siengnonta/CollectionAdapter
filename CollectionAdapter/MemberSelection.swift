//
//  MemberSelection.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 26/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class EkoMemberSelectionViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var collectionView: UICollectionView!
    private var tableAdapter: AdapterType = ListAdapter()
    private var collectionAdapter: AdapterType = CollectionAdapter()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableAdapter.tableView = tableView
        tableAdapter.register(cellClasses: [UserCell.self])
        
        collectionAdapter.collectionView = collectionView
        collectionAdapter.register(cellClasses: [UserCollection.self])
    }
    
    static func createInstance(tableAdapter: AdapterType = Adapter(), collectionAdapter: AdapterType = Adapter()) -> EkoMemberSelectionViewController {
        let viewController = EkoMemberSelectionViewController()
        viewController.tableAdapter = tableAdapter
        viewController.collectionAdapter = collectionAdapter
        return viewController
    }
}
