//
//  MeasureViewController.swift
//  GyroData
//
//  Created by kimseongjun on 2023/06/14.
//

import UIKit


class MeasureViewController: UIViewController {
    

    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Acc", "Gyro"])
        control.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        
        return control
    }()
    
    private let accelerometerGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let gyroGraphView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configureSegmentedControl()
    }
    
    private func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(segmentedControl)
        view.addSubview(accelerometerGraphView)
        view.addSubview(gyroGraphView)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9),
            
            
            accelerometerGraphView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            accelerometerGraphView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            accelerometerGraphView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9),
            accelerometerGraphView.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.9),
            
            gyroGraphView.topAnchor.constraint(equalTo: accelerometerGraphView.topAnchor),
            gyroGraphView.leadingAnchor.constraint(equalTo: accelerometerGraphView.leadingAnchor),
            gyroGraphView.trailingAnchor.constraint(equalTo: accelerometerGraphView.trailingAnchor),
            gyroGraphView.bottomAnchor.constraint(equalTo: accelerometerGraphView.bottomAnchor)
        ])
    }
    
    private func configureSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        changeValue()
    }
    
    @objc
    private func changeValue() {
        segmentedControl.selectedSegmentIndex == 0 ? presentAccelerometerGraphView() : presentGyroGraphView()
        
    }
    
    private func presentAccelerometerGraphView() {
        accelerometerGraphView.isHidden = false
        gyroGraphView.isHidden = true
    }
    
    private func presentGyroGraphView() {
        accelerometerGraphView.isHidden = true
        gyroGraphView.isHidden = false
    }
}
