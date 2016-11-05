//: Playground - noun: a place where people can play

//currently licensed under:
//Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
//i'll probably go more open as the project develops
//author: jeremiah milbauer

import UIKit

enum LabType { //done
    case Spirometer, HeartRate, BloodPressure
    func getString() -> String {
        switch self {
        case .Spirometer: return "Spirometer"
        case .HeartRate: return "Heart Rate (BPM)"
        case .BloodPressure: return "Blood Pressure"
        }
    }
}

enum ScheduleInterval { //done
    case Hour, Day, Week, Month, Year, AsNeeded
    func toString() -> String {
        switch self {
        case .Hour: return "Hourly"
        case .Day: return "Daily"
        case .Week: return "Weekly"
        case .Month: return "Monthly"
        case .Year: return "Yearly"
        case .AsNeeded: return "As Needed"
        }
    }
}

enum Sex {
    case Male, Female
    func toString() -> String {
        switch self {
        case .Male: return "Male"
        case .Female: return "Female"
    }
}
    
    


struct Patient {
    var name: String
    var dob: NSDate
    var sex: Sex
    var gender: String
}

struct Physician { //done
    var name: String
    var nip: Int
}

struct Diagnostic { //done
    var when: NSDate
    var self_reported: Bool
    var labname: LabType
    var value: Double
    var description: String
    //var image: NSImage?
}

struct Procedure { //done
    var when: NSDate
    var physician: Physician
    var reason: String
    var complications: String
    var notes: String
}

struct FreqType { //done
    var min_count: Int
    var max_count: Int
    var interval: ScheduleInterval
}

struct Medication { //done
    var name: String
    var reason: String
    var warnings: [String]
    var dose: String
    var frequency: FreqType
    var max_frequency: FreqType
    var start: NSDate
    var end: NSDate
}






public class MEDEvent {
    //absolutes
    let context_prompt = "What were you feeling and what were you doing?"
    let fife_prompt = "What were your thoughts and feelings at the time?"
    
    //fields
    var date: NSDate
    var context: String
    var symptoms: [(String, Int)]
    var fife: String
    var diagnostics: [Diagnostic]
    
    //constructors
    init(when: NSDate) {
        self.date = when
        self.context = ""
        self.symptoms = []
        self.fife = ""
        self.diagnostics = []
    }
    
    //methods
    func addSymptom(desc: String, scale: Int) {
        self.symptoms.append((desc, scale))
    }
    
    func addDiagnostic(newTest: Diagnostic) {
        self.diagnostics.append(newTest)
    }
}

public class Note: MEDEvent {
    //fields
    var further_action: String
    
    //constructors
    init(date: NSDate) {
        self.further_action = ""
        super.init(when: date)
    }
}

public class Visit: MEDEvent {
    
    //fields
    var physician: Physician
    var location: String
    var date_out: NSDate
    var description: String //description of care
    var medications: [Medication]
    var procedures: [Procedure]
    
    //constructors
    init(doctor: Physician, location: String, date_in: NSDate, date_out: NSDate) {
        self.date_out = date_out
        self.physician = doctor
        self.location = location
        self.description = ""
        self.medications = []
        self.procedures = []
        super.init(when: date_in)
    }
    
    //methods
    func getSummary() -> String {
        return "smile"
    }
}
