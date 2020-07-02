//
//  RecentViewController.swift
//  UIKitPoc
//
//  Created by Nontapat Siengsanor on 2/7/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

struct ViewStyle {
    let backgroundColor: UIColor
}

protocol RecentChatModelType: ModelType {
    var avatar: UIColor { get }
    var title: String { get }
    var unreadNumber: Int { get }
}

struct RecentChatModel: RecentChatModelType {
    let avatar: UIColor
    let title: String
    let unreadNumber: Int
}

protocol RecentChatViewDelegate: class {
    func didSelect(chat: String)
}

class RecentListAdapter: ListAdapter {
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView?.dequeueReusableCell(withIdentifier: NSStringFromClass(RecentCell.self)) as! RecentCell
        let model = item(at: indexPath) as! RecentChatModelType
//        cell.backgroundColor = model.avatar
        cell.textLabel?.text = model.title
        cell.selectionStyle = .none
        return cell
    }
}

class RecentCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RecentChatView: UIView, AdapterViewType {
    private let tableView = UITableView(frame: .zero, style: .plain)
    weak var delegate: RecentChatViewDelegate?
    
    var adapter: ListAdapterType
    
    required init(adapter: ListAdapterType = RecentListAdapter()) {
        self.adapter = adapter
        super.init(frame: .zero)
        tableView.register(RecentCell.self, forCellReuseIdentifier: NSStringFromClass(RecentCell.self))
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

extension RecentChatView: AdapterDelegate {
    
    func didSelectRow(at indexPath: IndexPath) {
        delegate?.didSelect(chat: "aaa")
    }
    
    func reachBottom() {
        // laod more
    }
    
}


// VC

class EkoRecentChatViewController: UIViewController {
    let recentChatView = RecentChatView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(recentChatView)
        recentChatView.frame = view.frame
        recentChatView.delegate = self
        let items: [RecentChatModel] = [RecentChatModel(avatar: .systemGray2, title: "HHH", unreadNumber: 30)]
        recentChatView.adapter.feed(items: items)
    }
    
    static func createInstance(style: ViewStyle) -> EkoRecentChatViewController {
        let vc = EkoRecentChatViewController()
        return vc
    }
}

extension EkoRecentChatViewController: RecentChatViewDelegate {
    func didSelect(chat: String) {
        print(chat)
    }
}

