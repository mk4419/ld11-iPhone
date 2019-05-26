import UIKit

class ViewController: UIViewController {
    
    var saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func camera() {
        saveData.removeObject(forKey: "decoText")
        saveData.removeObject(forKey: "labelCheckNum")
        saveData.removeObject(forKey: "labelArray")
        saveData.removeObject(forKey: "labelposiXArray")
        saveData.removeObject(forKey: "labelposiYArray")
        
        saveData.removeObject(forKey: "photoCheckNum")
        saveData.removeObject(forKey: "photoImageArray")
        saveData.removeObject(forKey: "photoposiXArray")
        saveData.removeObject(forKey: "photoposiYArray")
        
        saveData.removeObject(forKey: "saveArray")
        print("camerabt")
        self.performSegue(withIdentifier: "camera", sender: nil)
    }
}

