//
//  ViewController.swift
//  CustomCalculator
//
//  Created by Robert Hails on 9/7/17.
//  Copyright © 2017 Robert Hails. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var tempNum = ""
    var leftVal = ""
    var rightVal = ""
    var answer = ""
    
    enum Operation: String{
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberPressed(sender: UIButton){
        tempNum += "\(sender.tag)"
        label.text = tempNum
    }
    
    @IBAction func addPressed(sender: UIButton){
        processOp(operation: .Add)
    }
    
    @IBAction func subPressed(sender: UIButton){
        processOp(operation: .Subtract)
    }
    
    @IBAction func multPressed(sender: UIButton){
        processOp(operation: .Multiply)
    }
    
    @IBAction func divPressed(sender: UIButton){
        processOp(operation: .Divide)
    }
    
    @IBAction func equalsPressed(sender: UIButton){
        processOp(operation: currentOperation)
    }
    
    @IBAction func clearEverything(sender: UIButton){
        tempNum = "0"
        label.text = tempNum
        currentOperation = Operation.Empty
    }
    
    @IBAction func deletePressed(sender: UIButton){
        if(label.text != "0"){
            let index = tempNum.index(tempNum.startIndex, offsetBy: tempNum.count-1)
            //tempNum = tempNum.substring(to: index)
            tempNum = String(tempNum[..<index])
            if(tempNum == ""){
                label.text = "0"
            }
            else{
                label.text = tempNum
            }
        }
        else{
            tempNum = ""
            label.text = "0"
        }
    }
    
    
    func processOp(operation: Operation){
        if currentOperation != Operation.Empty{
            if tempNum != ""{
                rightVal = tempNum
                tempNum = ""
                
                if currentOperation == Operation.Add{
                    answer = "\(Double(leftVal)! + Double(rightVal)!)"
                }
                else if currentOperation == Operation.Subtract{
                    answer = "\(Double(leftVal)! - Double(rightVal)!)"
                }
                else if currentOperation == Operation.Multiply{
                    answer = "\(Double(leftVal)! * Double(rightVal)!)"
                }
                else if currentOperation == Operation.Divide{
                    answer = "\(Double(leftVal)! / Double(rightVal)!)"
                }
                
                leftVal = answer
                label.text = answer
                currentOperation = operation
            }
        }
        else{
            leftVal = tempNum
            tempNum = ""
            currentOperation = operation
        }
    }
    


}

