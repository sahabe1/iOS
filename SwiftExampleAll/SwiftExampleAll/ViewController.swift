//
//  ViewController.swift
//  SwiftExampleAll
//
//  Created by Macbook on 1/11/18.
//  Copyright © 2018 Sahabe Alam. All rights reserved.
//

import UIKit

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
class ViewController: UIViewController {

    
    var string = "alam"
   // var printerName = "Big B"
    var name: String = "" {
        didSet{
            nameLabel.text = name
        }

    }
    func test (name:String,score:Int)-> String{return "Hi \(name) and sc"}
    func functionWithCloser(handler:(String)->Void) -> Void {
        handler("Good Night!")
    }

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()




        let numbers: [Int?] = [2, 1,1, 3, nil, 4, 7, nil, 11]




        let flattened = numbers.map { $0
        }

print(flattened)
        let flatMappedNumbers = numbers.flatMap { $0 }
        print(flatMappedNumbers)










        simpleCloser("Alam")

functionWithCloser(handler: {(result)-> Void in
    print(result)
})
        print(getTime().hour)
        print(getTime().minute)
        print(getTime().second)
        closerInsideCloser(handler: {(result) -> Void in
            print(result)
        })
//        addItem(item: 1)
//        addItem(item: "y")
        let xx:String = "Good"
        let yy:Substring = "Good"
        if xx == yy{
            print("equal")
        }


        let namee = "Mahmud Ahsan"
        for x in namee{
            print(x)
        }

        let num = [1, 2, 3, 4, 5]
        for x in num[2...]{
            print(x)
        }


//        for i in 1...10{
//            let personType = i % 3 == 0 ? "\(i)Cake" : i % 5 == 0 ? "\(i)Pizza" : "\(i)Pasta"
//            print(personType)
//        }

        var age = 13
        age = age + 1
        age += 1


        let (x, y) = (1, 2)
        if x == y{
            //do something
        }

        let xE = "My name is " + " Khan"


        let touple  = (name:"Alam",age:25,gender:"Male",nameLabel:nameLabel)
        touple.nameLabel.text = touple.name
        print(touple.age)
        print(string.suffix(2))
        name = touple.gender
        print(multiReturnType(parameter: ["Name":"Alam"]).firstName)

        let genArray = makeArray(repeating: "St", numberOfTimes: 4)
        print(genArray)

        greet(person: ["name1":"ALam","location":"Delhi"])
        optionalBinding()
        someFunction(parameterWithoutDefault: 4)
        someFunction(parameterWithoutDefault: 4, parameterWithDefault: 9)

        loginUserAPI(params: "Alam", success: {(respons) -> Void in
            print(respons)

        },
                     failure: {(response) -> Void in

                        print(response)

        }
        )

    }

    func loginUserAPI(params: String,  success:@escaping (String) -> Void, failure:@escaping (String) -> Void){

        if params == "ALam" {
            success(params)
        }
        else{
failure("Failed")
        }
    }

    var simpleCloser = {(name:String) -> Void in
        print(name)
    }
    func closerExample(apiURL: String,success:@escaping(String) -> Void,failure:@escaping(String) -> Void) -> Void {

    }
    // With Default values in Functions as Parameter

    func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // If you omit the second argument when calling this function, then
        // the value of parameterWithDefault is 12 inside the function body.
        print(parameterWithDefault + parameterWithoutDefault);
        closerExample(apiURL: "", success: {(result) -> Void in
        }
        , failure: {(error) -> Void in
        }
        )
    }

    func closerInsideCloser(handler:(String) -> Void)  {
        handler("name")
    }

    // Multi return Type
    func getTime() -> (hour:Int, minute:Int, second:Int) {
        let hour = 0
        let minute = 10
        let second = 40
        return ( hour, minute, second)
    }

// Use of Gaurd Statement
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }

        print("Hello \(name)!")

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }

        print("I hope the weather is nice in \(location).")
    }
    // Iterate Key and Value from dictionary
    func iterateKeyValueFromDictionary() {
        let airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
    }

    // Optional Binding

    func optionalBinding() {
        let possibleNumber : Int? = nil

        if let number = possibleNumber{
            print("Number  Exist")
        }
        else{
            print("Number dosen't Exist")
        }

    }

    // Generic Fuction
    func makeArray<String>(repeating item: String, numberOfTimes: Int) -> [String] {
        var result = [String]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }

    func addItem<T>(item:T) {
        print(item);
    }
    func handleError() {
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch PrinterError.noToner {
            print("Printer error: \(PrinterError.onFire.localizedDescription).")
        } catch PrinterError.outOfPaper{
            print(PrinterError.onFire.localizedDescription)
        }
        catch{
            print(error)
        }
    }
    // Error Handling
    func send(job: Int, toPrinter printerName: String) throws -> String {
        if printerName == "Never Has Toner" {
            throw PrinterError.outOfPaper
        }
        return "Job sent"
    }

    // Loop With Where Clause
    func loopWithWhere() {
        print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ")

        for var i in (0..<10) where i%3 == 0 {
            print(i)
            // Do any additional setup after loading the view, typically from a nib.
        }
    }

    // Print Pattern
    func printPattern() {
        for var i  in 1...15{

            if (i%3 == 0 ){
                print("\(i) Fizz")
            }
            else if (i%5 == 0){
                print("\(i) Buzz")
            }
            else{
                print("\(i)")
            }
        }
    }

    // Multiple Return Type
    func multiReturnType(parameter:[String:Any]) ->(firstName:String,lastName:String)
    {
        return ("Alam","Sahabe")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// Methode Overloading
    func addNumber(num:Int) {

    }

    func addNumber(num:Float) {

    }


}
// MARK : - UIImage Extension Load Image From Remote
extension UIImageView {
    func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
        self.image = placeholder
        let spinnerView = UIView.init(frame: self.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        spinnerView.addSubview(ai)
        self.addSubview(spinnerView)
        URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                    spinnerView.removeFromSuperview()
                }
            }
        }).resume()
    }
}

