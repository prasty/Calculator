//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Prayudi Satriyo Nugroho on 5/10/16.
//  Copyright © 2016 Prayudi Satriyo Nugroho. All rights reserved.
//

import Foundation

func multiply(op1:Double, op2:Double) -> Double{
    return op1*op2
}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    var operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "⨉": Operation.BinaryOperation(multiply),
        "=": Operation.Equals
        //comment huaha coba
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol:String) {
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            //case .BinaryOperation(let function): accumulator = function(accumulator)
            case .Equals: break
            default: break
            }
        }
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
}