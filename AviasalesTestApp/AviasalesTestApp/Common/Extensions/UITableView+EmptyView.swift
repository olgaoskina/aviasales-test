//
//  UITableView+EmptyView.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 22.07.2021.
//

import UIKit

extension UITableView {
    
    func showEmptyViewIfNeed(_ count: Int){
        if count == 0 {
            let empty = EmptyView(frame: self.bounds)
            self.backgroundView = empty
            self.separatorStyle = .none
        } else {
            self.backgroundView = nil
            self.separatorStyle = .singleLine
        }
    }
}
