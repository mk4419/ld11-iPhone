import UIKit

class TextAddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textView: UITextView!
    @IBOutlet var textField: UITextField!
    
    var decoText: [String] = []
    var labelChekNum: Int = 0
    
    var labelposiXArray: [Float] = []
    
    var labelposiYArray: [Float] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "decoText") != nil {
            decoText = saveData.object(forKey: "decoText") as! [String]
        }
        if saveData.object(forKey: "labelChekNum") != nil {
            labelChekNum = saveData.integer(forKey: "labelChekNum")
        }
        if saveData.object(forKey: "labelposiXArray") != nil {
            labelposiXArray = saveData.object(forKey: "labelposiXArray") as! [Float]
        }
        if saveData.object(forKey: "labelposiYArray") != nil {
            labelposiYArray = saveData.object(forKey: "labelposiYArray") as! [Float]
        }
        
        textView.text = ""
        textField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.text = textField.text
        
        textView.returnKeyType = .done
        
        //キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cansel() {
        self.performSegue(withIdentifier: "cansel", sender: nil)
    }
    
    @IBAction func done() {
        labelposiXArray.append(Float(view.center.x))
        labelposiYArray.append(Float(view.center.y + 100))
        labelChekNum = labelChekNum + 1
        //textView.text = "Test"
        decoText.append(textField.text!)
        saveData.set(labelChekNum, forKey: "labelChekNum")
        saveData.set(decoText, forKey: "decoText")
        saveData.set(labelposiXArray, forKey: "labelposiXArray")
        saveData.set(labelposiYArray, forKey: "labelposiYArray")
        for i in 0 ..< labelChekNum {
           print(decoText[i])
            print(labelChekNum)
        }
        print("donebt")
        self.performSegue(withIdentifier: "done", sender: nil)
    }
}
