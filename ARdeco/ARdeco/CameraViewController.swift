import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
   
    @IBOutlet weak var cameraView: UIView!
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    var checknum: Int = 0
    var decoText: [String] = []
    
    var labelArray: [UILabel] = []
    
    let savaData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if savaData.array(forKey: "decoText") != nil {
            decoText = savaData.object(forKey: "decoText") as! [String]
        }
        if savaData.object(forKey: "checknum") != nil {
            checknum = savaData.integer(forKey: "checknum")
        }
        print(decoText)
        print(checknum)
        
        //Labelを作成
        for i in 0 ..< checknum {
            let mylabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
            mylabel.text = decoText[i]
            labelArray.append(mylabel)
        }
        
        print(labelArray)
        
        for i in 0 ..< checknum {
            labelArray[i].textColor = UIColor.blue
            labelArray[i].textAlignment = NSTextAlignment.center
            labelArray[i].layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
            labelArray[i].adjustsFontSizeToFitWidth = true
            labelArray[i].isUserInteractionEnabled = true
            self.view.addSubview(labelArray[i])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //カメラの起動と表示
        captureSesssion = AVCaptureSession()
        stillImageOutput = AVCapturePhotoOutput()
        
        captureSesssion.sessionPreset = AVCaptureSession.Preset.hd1920x1080 // 解像度の設定
        
        let device = AVCaptureDevice.default(for: .video)
    
        do {
            let input = try AVCaptureDeviceInput(device: device!)
            
            // 入力
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                
                // 出力
                if (captureSesssion.canAddOutput(stillImageOutput!)) {
                    captureSesssion.addOutput(stillImageOutput!)
                    captureSesssion.startRunning() // カメラ起動
                    
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSesssion)
                    previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect // アスペクトフィット
                    previewLayer?.connection!.videoOrientation = AVCaptureVideoOrientation.portrait // カメラの向き
                    
                    cameraView.layer.addSublayer(previewLayer!)
                    // ビューのサイズの調整
                    previewLayer?.position = CGPoint(x: self.cameraView.frame.width/2, y: self.cameraView.frame.height/2)
                    previewLayer?.bounds = cameraView.frame
                }
            }
        }
        catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textadd() {
        print("textAddbt")
        self.performSegue(withIdentifier: "textAdd", sender: nil)
    }
}
