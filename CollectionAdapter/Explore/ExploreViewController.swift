//
//  ExploreViewController.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 30/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    let recommendedAdapter: CollectionAdapter
    let trendingAdapter: ListAdapter
    let categoriesAdapter: CollectionAdapter
    
    var recommendedView = RecommendedCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var trendingView = TrendingTableView()
    var categoriesView = CategoriesCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init(recommendedAdapter: CollectionAdapter, trendingAdapter: ListAdapter, categoriesAdapter: CollectionAdapter) {
        self.recommendedAdapter = recommendedAdapter
        self.trendingAdapter = trendingAdapter
        self.categoriesAdapter = categoriesAdapter
        super.init(nibName: nil, bundle: nil)
        recommendedView.setup(adapter: recommendedAdapter)
        trendingView.setup(adapter: trendingAdapter)
        categoriesView.setup(adapter: categoriesAdapter)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        self.recommendedAdapter = RecommendedAdapter()
        self.trendingAdapter = ListAdapter()
        self.categoriesAdapter = CollectionAdapter()
        super.init(coder: coder)
        recommendedAdapter.collectionView = recommendedView
        recommendedView.setup(adapter: recommendedAdapter)
        trendingView.setup(adapter: trendingAdapter)
        categoriesView.setup(adapter: categoriesAdapter)
        commonInit()
    }
    
    private func commonInit() {
        recommendedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recommendedView)
        NSLayoutConstraint.activate([
            recommendedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recommendedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recommendedView.topAnchor.constraint(equalTo: view.topAnchor),
            recommendedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}


//

enum Screen {
    case SDKViewControllerA
    case SDKViewControllerB
    case SDKViewControllerC
}

protocol NavigationDelegate {
    func getViewControllerForScreen(screen: Screen) -> UIViewController?
}


// Guess this class handles all navigation and is singleton ?
// and cannot be subclassed ??
class ViewControllerPresenter {
    
    static var shared = ViewControllerPresenter()
    
    var navigationDelegate: NavigationDelegate?
    
    func presentScreen(screen: Screen, from: UIViewController) {
        
        if let customVc = navigationDelegate?.getViewControllerForScreen(screen: screen) {
            // If user has provided their own custom vc, present/push that
            from.navigationController?.pushViewController(customVc, animated: true)
        } else {
            
            // If user has not provided any custom vc, then use ours
            let ourSdkVc = getViewController(screen: screen)
            from.navigationController?.pushViewController(ourSdkVc, animated: true)
        }
    }
    
    private func getViewController(screen: Screen) -> UIViewController {
        
        switch screen {
        case .SDKViewControllerA:
            return SDKViewControllerA()
        case .SDKViewControllerB:
            return SDKViewControllerB()
        case .SDKViewControllerC:
            return SDKViewControllerC()
        }
    }
}


// -------
// ViewControllers in UIKit for Screen A, B, C
// ------

class SDKViewControllerA: UIViewController {
    
    var presenter = ViewControllerPresenter.shared
    
    func moveToScreenBAfterButtonAction() {
        presenter.presentScreen(screen: .SDKViewControllerB, from: self)
    }
}

class SDKViewControllerB: UIViewController {
    
    var presenter = ViewControllerPresenter.shared
    
    func moveToScreenBAfterButtonAction() {
        presenter.presentScreen(screen: .SDKViewControllerB, from: self)
    }
}

class SDKViewControllerC: UIViewController {
    
    var presenter = ViewControllerPresenter.shared
    
    func moveToScreenBAfterButtonAction() {
        presenter.presentScreen(screen: .SDKViewControllerB, from: self)
    }
}


// -------
// User's custom view controller for Screen B
// ------

class UserViewControllerB: UIViewController {
    
    var presenter = ViewControllerPresenter.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func moveToSDKScreenCAfterButtonTap() {
        presenter.presentScreen(screen: .SDKViewControllerC, from: self)
    }
}


// -------
// User wants to override Screen
// ------

class OverrideDelegate: NavigationDelegate {
    
    func getViewControllerForScreen(screen: Screen) -> UIViewController? {

        // User wants to provide their own vc for screen B
        if screen == .SDKViewControllerB {
            return UserViewControllerB()
        }
        
        // Default will be used
        return nil
    }
}

ViewControllerPresenter.shared.navigationDelegate = OverrideDelegate()
