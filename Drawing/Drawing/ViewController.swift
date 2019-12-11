//
//  ViewController.swift
//  Drawing
//
//  Created by Eugene Berezin on 12/10/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

import UIKit



class ViewController: UIViewController {
    
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }

}

