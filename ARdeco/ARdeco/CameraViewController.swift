import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var slider: UISlider!
    
    var captureSesssion: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    //Labelの変数
    var decoText: [String] = []
    //var labelCheckNum: Int = 0
    var labelArray: [UILabel] = []
    var labelposiXArray: [Float] = []
    var labelposiYArray: [Float] = []
    
    //Imageの変数
    var imageview: [UIImageView] = []
    //var photoCheckNum: Int = 0
    var photoImageArray: [UIImage] = []
    var photoposiXArray: [Float] = []
    var photoposiYArray: [Float] = []
    //var nsdata: [NSData] = []
    var saveArray: Array! = [NSData]()
    
    let savaData = UserDefaults.standard
    
    // タッチしたビューの中心とタッチした場所の座標のズレを保持する変数
    var gapX:CGFloat = 0.0  // x座標
    var gapY:CGFloat = 0.0  // y座標
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.addTarget(self, action: #selector(sliderDidChangeValue(_:)), for: .valueChanged)
    }
    
    @objc func sliderDidChangeValue(_sender: UISlider) {
        print(slider.value)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if savaData.array(forKey: "decoText") != nil {
            decoText = savaData.object(forKey: "decoText") as! [String]
        }
        
        //labelのUD確認
//        if savaData.object(forKey: "labelChekNum") != nil {
//            labelCheckNum = savaData.integer(forKey: "labelCheckNum")
//        }
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
//        if savaData.object(forKey: "photoChekNum") != nil {
//            photoCheckNum = savaData.integer(forKey: "photoCheckNum")
//        }
        if savaData.array(forKey: "photoposiXArray") != nil {
            photoposiXArray = savaData.object(forKey: "photoposiXArray") as! [Float]
        }
        if savaData.array(forKey: "photoposiYArray") != nil {
            photoposiYArray = savaData.object(forKey: "photoposiYArray") as! [Float]
        }
//        if photoImageArray.count != 0 {
//            for i in 0 ..< photoImageArray.count {
//                photoImageArray[i] = UIImage(data: nsdata[i] as Data)!
//            }
        if savaData.object(forKey: "saveArray") != nil {
            let objects = savaData.object(forKey: "saveArray") as? NSArray
            
            saveArray.removeAll()
            for data in objects! {
                saveArray.append(data as! NSData)
            }
        }
        
        print(decoText)
        print(decoText.count)
        
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
        
        //Labelを作成
        for i in 0 ..< decoText.count {
            let mylabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 50))
            mylabel.text = decoText[i]
            labelArray.append(mylabel)
        }
        
        print(labelArray)
        
        for i in 0 ..< decoText.count {
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
        for k in 0 ..< photoImageArray.count {
            let myImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
            myImage.image = photoImageArray[k]
            imageview.append(myImage)
        }
        
        for k in 0 ..< photoImageArray.count {
            imageview[k].layer.position.x = CGFloat(photoposiXArray[k])
            imageview[k].layer.position.y = CGFloat(photoposiYArray[k])
            imageview[k].isUserInteractionEnabled = true
            imageview[k].tag = 100 + k
            self.view.addSubview(imageview[k])
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        if photoImageArray.count != 0 {
//            for k in 0 ..< photoImageArray.count {
//                nsdata[k] = photoImageArray[k].pngData()! as NSData
//            }
//        }
        for k in 0 ..< photoImageArray.count {
            let data = photoImageArray[k].pngData() as NSData?
            if let imageData = data {
                saveArray[k] = imageData
                
                savaData.set(saveArray, forKey: "saveArray")
                savaData.synchronize()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 最初にタッチした指のみ取得
        if let touch = touches.first {
            // タッチしたビューをviewプロパティで取得する
            if let touchedView = touch.view {
               print(touchedView.tag)
                // tagでlabelかそうでないかを判断する
                for i in 0 ..< decoText.count {
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
                
                // tagでImageViewかそうでないか判断する
                for k in 0 ..< photoImageArray.count {
                    if imageview[k].tag == touchedView.tag {
                        // タッチした場所とタッチしたビューの中心座標がどうずれているか
                        gapX = touch.location(in: view).x - touchedView.center.x
                        gapY = touch.location(in: view).y - touchedView.center.y
                        // 例えば、タッチしたビューの中心のxが50、タッチした場所のxが60→中心から10ずれ
                        // この場合、指を100に持って行ったらビューの中心は90にしたい
                        // ビューの中心90 = 持って行った場所100 - ずれ10
                        touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                        touchedView.center = touch.location(in: view)
                        photoposiXArray[k] = Float(touchedView.layer.position.x)
                        photoposiYArray[k] = Float(touchedView.layer.position.y)
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
                for i in 0 ..< decoText.count {
                    if labelArray[i].tag == touchedView.tag {
                        // gapX,gapYの取得は行わない
                        touchedView.center = CGPoint(x: touch.location(in: view).x - gapX, y: touch.location(in: view).y - gapY)
                    }
                }
                
                // tagでImageViewかそうでないかを判断する
                for k in 0 ..< photoImageArray.count {
                    if imageview[k].tag == touchedView.tag {
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
        savaData.set(photoposiXArray, forKey: "photoposiXArray")
        savaData.set(photoposiYArray, forKey: "photoposiYArray")
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
        photoImageArray.append((info[.originalImage] as? UIImage)!)
        //photoCheckNum = photoCheckNum + 1
        photoposiXArray.append(Float(view.center.x))
        photoposiYArray.append(Float(view.center.y + 100))
        //savaData.set(photoCheckNum, forKey: "photoCheckNum")
        savaData.set(photoposiXArray, forKey: "photoposiXArray")
        savaData.set(photoposiYArray, forKey: "photoposiYArray")
//        for k in 0 ..< photoImageArray.count {
//            nsdata.append(photoImageArray[k].pngData()! as NSData)
//        }
        for k in 0 ..< photoImageArray.count {
            let data = photoImageArray[k].pngData() as NSData?
            if let imageData = data {
                saveArray.append(imageData)
                
                savaData.set(saveArray, forKey: "saveArray")
                savaData.synchronize()
            }
        }
        //savaData.set(photoImageArray, forKey: "photoImageArray")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imagebt() {
        presentPickerController(sourceType: .photoLibrary)
    }
}
