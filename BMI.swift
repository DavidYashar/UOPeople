import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        if let ageStr = ageTextField.text, let gender = genderTextField.text, let weightStr = weightTextField.text,
           let age = Int(ageStr), let weight = Double(weightStr) {
            
            let person = Person(age: age, gender: gender, weight: weight)
            let bmiResult = person.calculateBMI()
            
            let bmiCategory = person.categorizeBMI(bmiResult)
            
            
            switch bmiCategory {
            case .normal:
                resultLabel.text = "Your BMI is \(bmiResult): Normal Weight"
            case .underweight:
                resultLabel.text = "Your BMI is \(bmiResult): Underweight"
            case .overweight:
                resultLabel.text = "Your BMI is \(bmiResult): Overweight"
            }
        }
    }
}

enum BMIStatus {
    case normal
    case underweight
    case overweight
}

class Person {
    var age: Int
    var gender: String
    var weight: Double
    
    init(age: Int, gender: String, weight: Double) {
        self.age = age
        self.gender = gender
        self.weight = weight
    }
    
    func calculateBMI() -> Double {
        let height = 1.75 
        let bmi = weight / (height * height)
        return bmi
    }
    
    func categorizeBMI(_ bmi: Double) -> BMIStatus {
        if bmi < 18.5 {
            return .underweight
        } else if bmi >= 18.5 && bmi <= 24.9 {
            return .normal
        } else {
            return .overweight
        }
    }
}
