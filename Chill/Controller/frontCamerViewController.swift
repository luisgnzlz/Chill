//
//  CameraViewController.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/25/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import AVFoundation



class frontCamerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let takePic = takePicButton()
    let cancelBttn = cancelButton()
    let photoLibButton = photoLibraryButton()
    var editPhotoViewC = UINavigationController(rootViewController: EditPhotoViewController())
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    var photoOutput: AVCapturePhotoOutput?
    var camerPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        frontCameraContr = self
        setUpCamerView()
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    func setUpCamerView() {
        view.addSubview(takePic)
        view.addSubview(cancelBttn)
        view.addSubview(photoLibButton)
        takePic.translatesAutoresizingMaskIntoConstraints = false
        cancelBttn.translatesAutoresizingMaskIntoConstraints = false
        photoLibButton.translatesAutoresizingMaskIntoConstraints = false
        
        cancelBttn.addTarget(self, action: #selector(cancelCamera), for: .touchUpInside)
        takePic.addTarget(self, action: #selector(takePhoto), for: .touchUpInside)
        photoLibButton.addTarget(self, action: #selector(photoLibrary), for: .touchUpInside)
        
        takePic.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        takePic.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        takePic.widthAnchor.constraint(equalToConstant: 50).isActive = true
        takePic.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cancelBttn.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cancelBttn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        cancelBttn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cancelBttn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        photoLibButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        photoLibButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        photoLibButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        photoLibButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func cancelCamera() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func takePhoto() {
        takePic.backgroundColor = .red
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera] , mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        currentCamera = backCamera
    }
    
    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            print(error)
        }
    }
    
    func setupPreviewLayer() {
        camerPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        camerPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        camerPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        camerPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(camerPreviewLayer!, at: 0)
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    @objc func photoLibrary() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        myPickerController.allowsEditing = false
        present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            EditImageView.image = image
        } else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
        present(editPhotoViewC, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func compeltedSave() {
        //captureSession.stopRunning()
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            EditImageView.image = UIImage(data: imageData)
            editPhotoViewC.delegate = nil
            present(editPhotoViewC, animated: true, completion: nil)
        }
    }
    
}
