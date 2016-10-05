//
//  ViewController.swift
//  HW1Calculator
//
//  Created by Lannie Miao on 9/7/16.
//  Copyright © 2016 Lannie Miao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberDisplayLabel: UILabel!
    
    var currOp = ""
    var previousOp = ""
    var result = Double()
    var operand = Double()
    var previousoperand = Double()
    var shouldClearNumberTextField = true
    var isRepeat = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberDisplayLabel.text = ("0")
       
    }

    
    @IBAction func numberButtonPressed(sender: UIButton) {
        if numberDisplayLabel.text! == "0"{
            numberDisplayLabel.text! = ""
        }
        print("Button pressed \(sender.titleLabel?.text!)")
        
        if shouldClearNumberTextField {
            numberDisplayLabel.text! = sender.titleLabel!.text!  //sender.titleLabel!.text!
            shouldClearNumberTextField = false
        } else {
            //result = 10*Double(numberDisplayLabel.text!)!
//            result += Double(sender.titleLabel!.text!)!
//            numberDisplayLabel.text! = "\(result)"
            
            numberDisplayLabel.text! += sender.titleLabel!.text!
            
            print ("sender is \(sender.titleLabel!.text!)")
            print ("display is \(result)")
        }
        isRepeat =  false
    }
    
    //declare button
    @IBOutlet weak var buttonOp: UIButton!
    @IBOutlet weak var buttonmultiply: UIButton!
    @IBOutlet weak var buttonminus: UIButton!
    @IBOutlet weak var buttonplus: UIButton!
    @IBOutlet weak var buttonequal: UIButton!
    @IBOutlet weak var buttonpercent: UIButton!
    @IBOutlet weak var buttonneg: UIButton!
    @IBOutlet weak var buttonclear: UIButton!
    
    @IBAction func operationButtonPressed(sender: UIButton) {
        if sender.highlighted == false{
            sender.backgroundColor = UIColor.orangeColor()
        }
        switch sender.titleLabel!.text!{
        case "+":
            print("Called plus")
            currOp = "+"
            operand = Double(numberDisplayLabel.text!)!
            result = operand
            numberDisplayLabel.text = "\(result)"
            print("plus result is \(result)")
            isRepeat = false
            shouldClearNumberTextField = true
            if sender.highlighted == true {
                sender.backgroundColor = UIColor.redColor()
                buttonOp.backgroundColor = UIColor.orangeColor()
                buttonmultiply.backgroundColor = UIColor.orangeColor()
                buttonminus.backgroundColor = UIColor.orangeColor()
            }
            isTyping = false
        case "-":
            print("called minus")
            currOp = "-"
            operand = Double(numberDisplayLabel.text!)!
            result = operand
            numberDisplayLabel.text = "\(result)"
            print("minus result is \(result)")
            isRepeat = false
            shouldClearNumberTextField = true
            if sender.highlighted == true {
                sender.backgroundColor = UIColor.redColor()
                buttonOp.backgroundColor = UIColor.orangeColor()
                buttonmultiply.backgroundColor = UIColor.orangeColor()
                buttonplus.backgroundColor = UIColor.orangeColor()
            }
            isTyping = false
            
        case "x":
            print("called multiply")
            currOp = "x"
            operand = Double(numberDisplayLabel.text!)!
            result = operand
            numberDisplayLabel.text = "\(result)"
            print("multiply result is \(result)")
            isRepeat = false
            shouldClearNumberTextField = true
            if sender.highlighted == true {
                sender.backgroundColor = UIColor.redColor()
                buttonOp.backgroundColor = UIColor.orangeColor()
                buttonminus.backgroundColor = UIColor.orangeColor()
                buttonplus.backgroundColor = UIColor.orangeColor()
            }
            isTyping = false
        case "÷":
            print("called divide")
            currOp = "/"
            operand = Double(numberDisplayLabel.text!)!
            result = operand
            numberDisplayLabel.text = "\(result)"
            print("multiply result is \(result)")
            isRepeat = false
            shouldClearNumberTextField = true
            if sender.highlighted == true {
                sender.backgroundColor = UIColor.redColor()
                buttonminus.backgroundColor = UIColor.orangeColor()
                buttonmultiply.backgroundColor = UIColor.orangeColor()
                buttonplus.backgroundColor = UIColor.orangeColor()
            }
            isTyping = false
        case "=":
            isTyping = false
            print("Called =")
            buttonOp.backgroundColor = UIColor.orangeColor()
            buttonmultiply.backgroundColor = UIColor.orangeColor()
            buttonminus.backgroundColor = UIColor.orangeColor()
            buttonplus.backgroundColor = UIColor.orangeColor()
            if (!isRepeat){
                if currOp == "+" {
                    operand = Double(numberDisplayLabel.text!)!
                    previousoperand = operand
                    result += operand
                    currOp = ""
                    previousOp = "+"
                    numberDisplayLabel.text = "\(result)"
                    print("result2 is\(result), isRepeat is \(isRepeat)")
                    
                }
                
                if currOp == "-" {
                    operand = Double(numberDisplayLabel.text!)!
                    previousoperand = operand
                    result -= operand
                    currOp = ""
                    previousOp = "-"
                    numberDisplayLabel.text = "\(result)"
                    print("result2 is\(result), isRepeat is \(isRepeat)")
                    
                }
                
                if currOp == "x" {
                    operand = Double(numberDisplayLabel.text!)!
                    previousoperand = operand
                    result *= operand
                    currOp = ""
                    previousOp = "x"
                    numberDisplayLabel.text = "\(result)"
                    print("result2 is\(result), isRepeat is \(isRepeat)")
                    
                }
                
                if currOp == "/" {
                    operand = Double(numberDisplayLabel.text!)!
                    previousoperand = operand
                    result /= operand
                    currOp = ""
                    previousOp = "/"
                    numberDisplayLabel.text = "\(result)"
                    print("result2 is\(result), isRepeat is \(isRepeat)")
                    
                }
            }else{
                if previousOp == "+"{
                    currOp = ""
                    result += previousoperand
                    numberDisplayLabel.text = "\(result)"
                    print("result4 is\(result), isRepeat is \(isRepeat)")
                    isRepeat = true
                }
                else if previousOp == "-"{
                    currOp = ""
                    result -= previousoperand
                    numberDisplayLabel.text = "\(result)"
                    print("result4 is\(result), isRepeat is \(isRepeat)")
                    isRepeat = true
                }
                else if previousOp == "x"{
                    currOp = ""
                    result *= previousoperand
                    numberDisplayLabel.text = "\(result)"
                    print("result4 is\(result), isRepeat is \(isRepeat)")
                    isRepeat = true
                }
                else if previousOp == "/"{
                    currOp = ""
                    result /= previousoperand
                    numberDisplayLabel.text = "\(result)"
                    print("result4 is\(result), isRepeat is \(isRepeat)")
                    isRepeat = true
                }
                
            }
            
            isRepeat = true
            
        default:
            break
        }
    }
    
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        print("clear")
        result = 0
        numberDisplayLabel.text = "0"
        currOp = ""
        shouldClearNumberTextField = true
        buttonOp.backgroundColor = UIColor.orangeColor()
        buttonmultiply.backgroundColor = UIColor.orangeColor()
        buttonminus.backgroundColor = UIColor.orangeColor()
        buttonplus.backgroundColor = UIColor.orangeColor()
        isTyping = false
    }
    
    
    private var isTyping = false
    
    @IBAction func addDecimal(sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "." {
            
            if !isTyping{
                numberDisplayLabel.text = "0."
            }
            if isTyping{
                if(numberDisplayLabel.text!.rangeOfString(".") == nil){
                    numberDisplayLabel.text = numberDisplayLabel.text! + "."
                    print("add (numberDisplayLabel.text)")
                }
            }else{
                
                isTyping = true
            }
        }
        

    }
    
    @IBAction func NegPos(sender: UIButton) {
        if numberDisplayLabel.text! == "0"{
            return
        }else{
            operand = Double(numberDisplayLabel.text!)!
            result = -operand
            numberDisplayLabel.text = "\(result)"
        }
       
    }
    
    @IBAction func percent(sender: UIButton) {
        operand = Double(numberDisplayLabel.text!)!
        result = operand/100
        numberDisplayLabel.text = "\(result)"
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

