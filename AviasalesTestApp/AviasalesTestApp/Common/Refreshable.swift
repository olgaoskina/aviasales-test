//
//  Refreshable.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import UIKit

@objc protocol Refreshable {
    @objc func refresh()
}

extension Refreshable {
    func addRefreshControl(to scrollView: UIScrollView) {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        scrollView.refreshControl = refreshControl
    }
}
