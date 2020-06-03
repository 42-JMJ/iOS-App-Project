//
//  BaseViewController.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/06/03.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var provider: Provider?

    override func viewDidLoad() {
        super.viewDidLoad()
        provideDependency()
    }

    func provideDependency() {

    }
}
