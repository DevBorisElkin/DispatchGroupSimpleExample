//
//  ViewController.swift
//  SingleViewApp
//
//  Created by test on 10.05.2022.
//

import UIKit

class ViewController: UIViewController {

    let array : [TimeInterval] = [
        1,
        3,
        5,
        7,
        2,
        7
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        let group = DispatchGroup()
        
        for number in array{
            group.enter()
            print("Entering group with number \(number)")
            DispatchQueue.global().asyncAfter(deadline: .now() + number, execute: {
                group.leave()
                print("leaving group with number \(number)")
            })
        }
        
        group.notify(queue: .main, execute: {
            print("Done with all operations")
            self.view.backgroundColor = .brown
        })
    }


}

