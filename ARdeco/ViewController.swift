import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func camera() {
        UserDefaults.standard.removeObject(forKey: "labelChekNum")
        UserDefaults.standard.removeObject(forKey: "decoText")
        print("camerabt")
        self.performSegue(withIdentifier: "camera", sender: nil)
    }
}

