//
//  EventDetailViewController.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet var saveButton: UIButton!
    
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var descTextView: UITextView!
    
    //MARK: Create ViewModel Object
    fileprivate var viewModel = EventListViewModel()
    var selectedDate: Date?
    
    fileprivate let timePicker = UIDatePicker()
    fileprivate var picker = UIPickerView()
    fileprivate let toolBar = UIToolbar()
    fileprivate var start_time: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Event Detail"
        
        if let date = selectedDate {
            dateLabel.text = date.toString(dateFormat: "dd-MMM-yyyy")
        }
        
        [timeTextField, titleTextField].forEach { textField in
            textField?.delegate = self
        }
    }
    
    //MARK: tappedSaveButton
    @IBAction func tappedSaveButton(_ sender: UIButton) {
        var events = viewModel.readDataFromUserDefaults()
        if let time = timeTextField.text,
           let title = titleTextField.text,
           let desc = descTextView.text {
            
            if isValidate(time: time, title: title, desc: desc) {
                let event = Event(date: selectedDate, time: start_time, title: title, eventDesc: desc)
                events.append(event)
                viewModel.storeEventsInUserDefaults(events: events)
                showAlert("Event created successfully!", buttons: ["Ok"]) { tappedIndex in
                    if tappedIndex == 0 {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
                
            }
        }
    }
}

extension EventDetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            openTimePicker()
            timePicker.tag = 1
        default:
            break
        }
    }
    
    func isValidate(time: String, title: String, desc: String) -> Bool {
        if time.trim().isEmpty {
            showAlert("Please select time!", buttons: ["Ok"], completion: nil)
            return false
        } else if title.trim().isEmpty {
            showAlert("Please enter title!", buttons: ["Ok"], completion: nil)
            return false
        } else if desc.trim().isEmpty {
            showAlert("Please enter description!", buttons: ["Ok"], completion: nil)
            return false
        } else {
            return true
        }
    }
}

extension EventDetailViewController {
    
    //Time Picker
    func openTimePicker() {
        timePicker.datePickerMode = .time
        
        if #available(iOS 14.0, *) {
            timePicker.preferredDatePickerStyle = .wheels
        }else{
            if #available(iOS 13.4, *) {
                timePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
        }
        let timeToolBar = UIToolbar()
        timeToolBar.barStyle = .default
        timeToolBar.sizeToFit()
        let doneTimeButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTimePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let canceTimelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelTimePicker))
        
        timeToolBar.setItems([canceTimelButton, spaceButton, doneTimeButton], animated: false)
        timeToolBar.isUserInteractionEnabled = true
        
        [timeTextField].forEach { (textfield) in
            textfield?.inputAccessoryView = timeToolBar
            textfield?.inputView = timePicker
        }
    }
    
    @objc func doneTimePicker() {
        if timePicker.tag == 1 {
            timeTextField.text = timePicker.date.toString(dateFormat: "hh:mm a")
            start_time = timePicker.date.toString(dateFormat: "hh:mm a")
        }
        self.view.endEditing(true)
    }
    
    @objc func cancelTimePicker(){
        self.view.endEditing(true)
    }
}
