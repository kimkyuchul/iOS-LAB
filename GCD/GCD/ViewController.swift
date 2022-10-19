//
//  ViewController.swift
//  GCD
//
//  Created by qualson1 on 2022/10/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnTap(_ sender: Any) {
        for i in 1...100 {
               print(i, terminator: " ")   // 1번째
        }
           
        DispatchQueue.main.sync {  // 2번째
            for i in 101...200 {
                print(i)
            }
        }
        print("\n kyuchul kyuchul") // 3번째
    }
}

