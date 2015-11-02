//: Playground - noun: a place where people can play

import UIKit
import Foundation
import Darwin

let range: Double = 737 - 8

let maxVal: Double = 736
let minVal: Double = 0

let tickCount: Double = 10
let unroundedTickSize: Double = range / (tickCount - 1)

let x = ceil(log10(unroundedTickSize) - 1);
let pow10x = pow(10, x);
let roundedTickRange = ceil(unroundedTickSize / pow10x) * pow10x
let min = roundedTickRange * floor(minVal / roundedTickRange)
let max = roundedTickRange * ceil(maxVal / roundedTickRange)
print(roundedTickRange)

x   
powf(12, 3)