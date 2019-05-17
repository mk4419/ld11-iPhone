import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    @IBOutlet weak var cameraView: UIView!
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    //Labelの変数
    var decoText: [String] = []
    var labelChekNum: Int = 0
    var labelArray: [UILabel] = []
    var labelposiXArray: [Float] = []
    var labelposiYArray: [Float] = []
    
    //Imageの変数
    var imageview: [UIImageView] = []
    var photoCheckNum: Int = 0
    var photoImageArray: [UIImageView] = []
    var photoposiXArray: [Float] = []
    var photoposiYArray: [Float] = []
    
    let savaData = UserDefaults.standard
    
    // タッチしたビューの中心とタッチした場所の座標のズレを保持する変数
    var gapX:CGFloat = 0.0  // x座標
    var gapY:CGFloat = 0.0  // y座標
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if savaData.array(forKey: "decoText") != nil {
            decoText = savaData.object(forKey: "decoText") as! [String]
        }
        
        //labelのUD確認
        if savaData.object(forKey: "labelChekNum") != nil {
            labelChekNum = savaData.integer(forKey: "labelChekNum")
        }
        if savaData.array(forKey: "labelArray") != nil {
            labelArray = savaData.object(forKey: "labelArray") as! [UILabel]
        }
        if savaData.array(forKey: "labelposiXArray") != nil {
            labelposiXArray = savaData.object(forKey: "labelposiXArray") as! [Float]
        }
        if savaData.array(forKey: "labelposiYArray") != nil {
            labelposiYArray = savaData.object(forKey: "labelposiYArray") as! [Float]
        }
        
        //photoImageのUD確認
        if savaData.object(forKey: "photoChekNum") != nil {
            photoCheckNum = savaData.integer(forKey: "photoChekNum")
        }
        if savaData.array(forKey: "photoImageArray") != nil {
            photoImageArray = savaData.object(forKey: "photoImageArray") as! [UIImageView]
        }
        if savaData.array(forKey: "photoposiXArray") != nil {
            photoposiXArray = savaData.object(forKey: "photoposiXArray") as! [Float]
        }
        if savaData.array(forKey: "photoposiYArray") != nil {
            photoposiYArray = savaData.object(forKey: "photoposiYArray") as! [Float]
        }
        print(decoText)
        print(labelChekNum)
        
        //Labelを作成
        for i in 0 ..< labelChekNum {
            let mylabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
            mylabel.text = decoText[i]
            labelArray.append(mylabel)
        }
        
        print(labelArray)
        
        for i in 0 ..< labelChekNum {
            labelArray[i].textColor = UIColor.blue
            labelArray[i].textAlignment = NSTextAlignment.center
            labelArray[i].layer.position.x = CGFloat(labelposiXArray[i])
            labelArray[i].layer.position.y = CGFloat(labelposiYArray[i])
            labelArray[i].adjustsFontSizeToFitWidth = true
            labelArray[i].isUserInteractionEnabled = true
            labelArray[i].tag = i
            self.view.addSubview(labelArray[i])
        }
        
        //UIImageを作成
        for k in 0 ..< photoCheckNum {
            var myImage: UIImage = UIImage()
            myImage = photoImageArray[k]
            imageview.append(myImage)
        }
        
        for k in 0 ..< photoCheckNum {
            imageview[k].layer.position.x = CGFloat(photoposiXArray[k])
            imageview[k].layer.position.y = CGFloat(photoposiYArray[k])
            imageview[k].
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            // タッチしたビューをviewプロパティで取得する
            if let touchedView = touch.view {
               print(touchedView.tag)
                // tagでlabelかそうでないかを判断する
                for i in 0 ..< labelChekNum {
                    if labelArray[i].tag == touchedView.tag {
                        // タッチした場所とタッチしたビューの中心座標がどうずれているか
                        gapX = touch.location(in: view).x - touchedView.center.x
                        gapY = touch.location(in: view).y - touchedView.center.y
                        // 例えば、タッチしたビューの中心のxが50、タッチした場所のxが60→中心から10ずれ
                        // この場合、指を100に持って行ったらビューの中心は90にしたい
                        // ビューの中心90 = 持って行った場所100 - ずれ10
                        touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                        touchedView.center = touch.location(in: view)
                        labelposiXArray[i] = Float(touchedView.layer.position.x)
                        labelposiYArray[i] = Float(touchedView.layer.position.y)
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesBeganと同じ処理だが、gapXとgapYはタッチ中で同じものを使い続ける
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            // タッチしたビューをviewプロパティで取得する
            if let touchedView = touch.view {
                // tagでlabelかそうでないかを判断する
                for i in 0 ..< labelChekNum {
                    if labelArray[i].tag == touchedView.tag {
                        // gapX,gapYの取得は行わない
                        touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // gapXとgapYの初期化
        gapX = 0.0
        gapY = 0.0
        savaData.set(labelposiXArray, forKey: "labelposiXArray")
        savaData.set(labelposiYArray, forKey: "labelposiYArray")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        // touchesEndedと同じ処理
        self.touchesEnded(touches, with: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func textadd() {
        print("textAddbt")
//        if (savaData.object(forKey: "labelArray") != nil) {
//            savaData.set(labelArray, forKey: "labelArray")
//        }
        self.performSegue(withIdentifier: "textAdd", sender: nil)
    }
    
    func  presentPickerController(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true, completion: nil)
        photoImageArray.append((info[.originalImage] as? UIImage)!)
        photoCheckNum = photoCheckNum + 1
        savaData.set(photoCheckNum, forKey: "photoCheckNum")
        savaData.set(photoImageArray, forKey: "photoImageArray")
    }
    
    @IBAction func imagebt() {
        presentPickerController(sourceType: .photoLibrary)
    }
}
