//
//  ViewController.swift
//  Timer
//
//  Created by GEU on 05/01/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimerField: UILabel!
    
    var timer: Timer?
    var elapsedSeconds = 0
    var selectedtime = 0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SegmentControl(_ sender: Any)
    {
        switch (sender as! UISegmentedControl).selectedSegmentIndex
        {
        case 0: selectedtime = 10 * 60
        case 1: selectedtime = 15 * 60
        case 2: selectedtime = 30 * 60
        default: selectedtime = 0
        }
    }
    
    @IBAction func PlayButton(_ sender: Any)
    {
        if selectedtime > 0 && !isRunning
        {
            isRunning = true
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
            TimerField.text = String(format: "%02d:%02d", selectedtime / 60, selectedtime % 60)
        }
    }
    
    @IBAction func ResumeButton(_ sender: Any)
    {
        isRunning = false
        TimerField.text = String(format: "%02d:%02d", 00, 00)
    }
   
    @IBAction func PauseButton(_ sender: Any)
    {
        if isRunning == true
        {
            isRunning = false
            timer?.invalidate()
            timer = nil
        }
    }
    
    @objc func tick() {
        guard isRunning else { return }
        if selectedtime > 0 {
            selectedtime -= 1
            elapsedSeconds += 1
            TimerField.text = String(format: "%02d:%02d", selectedtime / 60, selectedtime % 60)
        } else {
            isRunning = false
            timer?.invalidate()
            timer = nil
        }
    }
}
