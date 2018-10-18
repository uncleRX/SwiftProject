//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

var listArr = ["元素1","元素2","元素3"]
listArr.remove(at: 0)

//传递true以请求集合避免释放其存储,如果下次数组还需要加,则推荐传true,是一个优化点. 默认是false
listArr.removeAll(keepingCapacity: true)

var listArr1 = ["元素1","元素2","元素3"]
listArr1.append(contentsOf: ["元素1","元素2"])
var listArr2 = ["元素1","元素2","元素3"]
listArr2.removeLast()
listArr2.append("新增")

var students = ["Ben", "Ivy", "Jordell"]
students.append("Maxime")
students.append("Maxime")

class Student {
    var name :String?
}

let s1 = Student()
s1.name = "陆超"
let s2 = Student()
s2.name = "邓超"
let s3 = Student()
s3.name = "高超"
var studentList = [s1,s2,s3]

//快速替换已知元素1
if let i = students.firstIndex(of: "Maxime") {
    students[i] = "Max"
}

let obj = studentList.first { (Student) -> Bool in
     Student.name == "陆超"
}
print("obj\(obj?.name)")

//丢弃第一个元素,返回一个新数组
var newArr = students.dropFirst()

print(students)

//修改: 每个数组都有一个独立的值，其中包含所有元素的值。对于整数和其他结构这样的简单类型，这意味着当你更改一个数组中的值时，该元素的值不会在数组的任何副本中更改

var numbers = [1, 2, 3, 4, 5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers)
// Prints "[100, 2, 3, 4, 5]"
print(numbersCopy)
// Prints "[1, 2, 3, 4, 5]"



//当两个数组共享一份数据的时候,修改其值 是可以继续共享数据的,当这份值删除或者替换,则另外一份会持有原来的数据不受影响

class IntegerReference {
    var value = 10
}

var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers

firstIntegers[0].value = 100
secondIntegers[0].value = 200

print(firstIntegers[0].value)
print(secondIntegers[0].value)

//当这份值删除或者替换,则另外一份会持有原来的数据不受影响
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"

//#桥接 Array -> NSArray
//当你想要访问 NSArray实例中需要用到其Api 时候, 比如 addObj:  可以用类型转换操作符(as)来链接, 桥接成功前提是数组的元素类型必须是类,@objc协议(从Objective-C导入的协议或标记为@objc属性的协议)或者连接到基础类型的类型

//遍历数组的两种方式
let names = ["alice","bob","clic"]

for item in names {
    print(item)
}

for (index ,item) in names.enumerated() {
    print("index:\(index) value:\(item)")
}
