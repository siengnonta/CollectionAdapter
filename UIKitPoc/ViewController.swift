//
//  ViewController.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 1/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    var trendingView: TrendingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTreandingView()
    }
    
    private func setupTreandingView() {
        trendingView = TrendingView()
        trendingView.frame = view.frame
        trendingView.delegate = self
        view.addSubview(trendingView)
    }
    
}

extension TrendingViewController: TrendingViewDelegate {
    
    func didSelectRow(at indexPath: IndexPath) {
        print("didtap \(indexPath)")
    }
    
    func didJoin(item: Any) {
        
    }
    
}

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var adapter: ListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupDefaultAdapter() {
        tableView.frame = view.frame
        view.addSubview(tableView)
        setupCustomDataSourceAdapter()
        // setup
        adapter = ListAdapter()
        adapter.tableView = tableView
        adapter.delegate = self
//        adapter.feed(items: [.systemRed, .systemBlue, .systemGreen])
    }
    
    private func setupCustomDataSourceAdapter() {
        tableView.frame = view.frame
        view.addSubview(tableView)
        setupCustomDataSourceAdapter()
        // setup
        adapter = PurpleListAdapter()
        adapter.tableView = tableView
        adapter.delegate = self
//        adapter.feed(items: [.systemRed, .systemBlue, .systemGreen])
    }
    
}


extension ViewController: AdapterDelegate {
    func didSelectRow(at indexPath: IndexPath) {
        print("\(indexPath)")
    }
    func reachBottom() {
//        adapter.feed(items: [.systemRed, .systemBlue, .systemGreen, .systemTeal])
    }
}

extension UIColor: ModelType { }



