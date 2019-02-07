//
//  ViewController.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import UIKit

class ViewController<OutputType, ViewType>: UIViewController where ViewType: UIView {
    
    private(set) lazy var customView = ViewType()
    
    // MARK: - Module components
    
    let output: OutputType
    
    init(_ output: OutputType) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = customView
    }
}
