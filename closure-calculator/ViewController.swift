//
//  ViewController.swift
//  closure-calculator
//
//  Created by yasudamasato on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var calculateButton: UIButton! {
        didSet {
            calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        }
    }

    let addClosure = { (num1: Double, num2: Double) -> Double in
        num1 + num2
    }

    let sumClosure = { (num1: Double, num2: Double) -> Double in
        num1 - num2
    }

    let mulClosure = { (num1: Double, num2: Double) -> Double in
        num1 * num2
    }

    let divClosure = { (num1: Double, num2: Double) -> Double in
        num1 / num2
    }

    @objc private func didTapCalculateButton() {
        let num1 = Double(textField1.text!) ?? 0.0
        let num2 = Double(textField2.text!) ?? 0.0
        var result: Double = 0.0
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            result = addClosure(num1, num2)
        case 1:
            result = sumClosure(num1, num2)
        case 2:
            result = mulClosure(num1, num2)
        case 3:
            guard num2 != 0 else { return print("Divide by Zero")}
            result = divClosure(num1, num2)
        default:
            break
        }
        resultLabel.text = String(result)
    }
}

