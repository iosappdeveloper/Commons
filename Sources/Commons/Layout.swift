//
//  Layout.swift
//  Common
//
//  Created by Matoria, Ashok on 27/08/18.
//  Copyright © 2018 Matoria, Ashok. All rights reserved.
//

import UIKit

public enum Layout {
    /// Adds the subview inside the container view
    public static func add(_ subView: UIView, in containerView: UIView) {
        containerView.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            subView.topAnchor.constraint(equalTo: containerView.topAnchor),
            subView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    /// Adds the subview to layout guide's owning view and then expands it in the given layout guide
    public static func add(_ subView: UIView, insideContainer layoutGuide: UILayoutGuide) {
        assert(layoutGuide.owningView != nil)
        layoutGuide.owningView?.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            subView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            subView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
    }
}
