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
        //getData()
        
        var a = 4
        var b = "Hello"
        
        testClosures({ a, b in
            print("closure code \(b) \(a)")
        }, a, b)
        
        
    }
    
    // Dispatch Exmple
    
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
    
    // Closures Example
    
    func testClosures(_ someFunction: (Int, String) -> Void, _ someInt: Int, _ someString: String){
        print("function code \(someInt) \(someString)")
        someFunction(someInt, someString)
    }

    var closure = {
        (val: Int, val2: String) -> Void in
        //do something here
        print("\(val) \(val2)")
    }

}

