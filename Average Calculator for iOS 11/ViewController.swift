//
//  ViewController.swift
//  Average Calculator for iOS 11
//
//  Created by Sohardh Chobera on 18/06/18.
//  Copyright © 2018 Sohardh Chobera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEnterScore: UITextField!
    @IBOutlet weak var lblScores: UILabel!
    @IBOutlet weak var lblTotalAverage: UILabel!
    
    var arrStoredScores = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAddAction(_ sender: Any) {
        storeScores()
        
    }
    
    @IBAction func btnSubtractAction(_ sender: Any) {
        subtractScoreItem()
    }
    func subtractScoreItem(){
        if arrStoredScores.count != 0 {
            arrStoredScores.removeLast()
        }
        
        printScores()
    }
    
    func storeScores(){
        var textData = Double(txtEnterScore.text!)
        
        if textData == nil{
            textData = 0.0
        } else if textData != (nil) {
            arrStoredScores.append(textData!)
        }
       
        clearTxtScore()
        printScores()
    }
    
    func clearTxtScore(){
        txtEnterScore.text = ""
    }
    
    func printScores(){
        var printString = String(describing: arrStoredScores)
        printString = printString.replacingOccurrences(of: "[", with: "")
        printString = printString.replacingOccurrences(of: "]", with: "")
        
        lblScores.text = printString
        addArray()
    }
    
    func addArray(){
        let arrSum = arrStoredScores.reduce(0, {$0 + $1})
        calculateAverage(sum: arrSum)
    }
    
    func calculateAverage(sum: Double){
        let average = sum / Double(arrStoredScores.count)
        printAverage(tAverage: average)
    }
    
    func printAverage(tAverage: Double){
        lblTotalAverage.text = String(tAverage)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    func hideKeyboard(){
        txtEnterScore.resignFirstResponder()
    }
}

