//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by anda.zidele on 21/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var celsiusL: UILabel!
    @IBOutlet weak var tempS: UISlider!
    @IBOutlet weak var convertedTempL: UILabel!
    @IBOutlet weak var tempSegmentC: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        print("tempS:" ,tempS.value)
        updateTempLForSlider(value: tempS.value)
    }
    
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        print("tempS:" ,tempS.value)
        updateTempLForSlider(value: tempS.value)
    }
    
    func updateTempLForSlider(value: Float){
            let celsiusTemp = Int(value)
        celsiusL.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        switch tempSegmentC.selectedSegmentIndex {
        case 0:
            let fahreinheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahreinheitTempString + " ºF"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " K"
        }
        convertedTempL.text = convertedTempString
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double){
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    


}

