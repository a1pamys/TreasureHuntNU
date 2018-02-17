 //
//  QRViewController.swift
//  QRCodeReader
//
//  Created by Aigerim on 1/26/18.
//  Copyright © 2018 Aigerim Janaliyeva. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
let ansQR = "acm"

protocol AnswerSendable {
    func sendAnswer()
}

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    lazy var squareView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "rec")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scannerDelegate: AnswerSendable?
    
    var video = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        //session:
        let session = AVCaptureSession()
        //capture:
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            print("Error, oops")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        self.view.layer.addSublayer(video)
        
        
        self.view.addSubview(squareView)
        self.view.bringSubview(toFront: squareView)
        
        squareView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 320).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects != nil && metadataObjects.count != 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject {
                if object.type == AVMetadataObject.ObjectType.qr {
                    
                    if object.stringValue == ansQR {
//FIXME: - Go to second question
//                        self.present(DetailsViewController(), animated: true, completion: nil)
//                        self.dismiss(animated: false, completion: nil)
                        scanned = true
                        scannerDelegate?.sendAnswer()
                        navigationController?.popViewController(animated: false)
                    } else {
                        let alert = UIAlertController(title: "QRCode", message: "Wrong QR. Take another one", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}


