//
//  FeedAdapter.swift
//  CollectionAdapter
//
//  Created by Nontapat Siengsanor on 23/6/2563 BE.
//  Copyright © 2563 Nontapat Siengsanor. All rights reserved.
//

import Foundation

class FeedAdapter: Adapter<FeedModel> {
    convenience init() {
        self.init(dataManager: FeedDataManager())
    }
}
