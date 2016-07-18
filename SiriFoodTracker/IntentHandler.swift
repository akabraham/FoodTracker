//
//  IntentHandler.swift
//  SiriFoodTracker
//
//  Created by Andrew Abraham on 7/18/16.
//  Copyright © 2016 Andrew Abraham. All rights reserved.
//

import Intents

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Start my workout using <myApp>"
// "Pause my workout using <myApp>"
// "Resume my workout using <myApp>"
// "Cancel my workout using <myApp>"
// "End my workout using <myApp>"

class IntentHandler: INExtension, INStartWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling, INCancelWorkoutIntentHandling, INEndWorkoutIntentHandling {
    
    override func handler(for intent: INIntent) -> AnyObject {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
    
    // MARK: - INStartWorkoutIntentHandling
    func handle(sendMessage intent: INSendMessageIntent, completion: (INSendMessageIntentResponse) -> Void) {
        print("Message intent is being handled.")
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INSendMessageIntent.self))
        let response = INSendMessageIntentResponse(code: .success, userActivity: userActivity)
        completion(response)
    }
    
    // Implement resolution methods to provide additional information about your intent (optional).
    func resolveIsOpenEnded(forStartWorkout intent: INStartWorkoutIntent, with completion: (INBooleanResolutionResult) -> Void) {
        let resolutionResult = INBooleanResolutionResult.success(with: false)
        completion(resolutionResult)
    }
    
    func resolveGoalValue(forStartWorkout intent: INStartWorkoutIntent, with completion: (INDoubleResolutionResult) -> Void) {
        let resolutionResult = INDoubleResolutionResult.success(with: 5)
        completion(resolutionResult)
    }
    
    func resolveWorkoutGoalUnitType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutGoalUnitTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutGoalUnitTypeResolutionResult.success(with: INWorkoutGoalUnitType.minute)
        completion(resolutionResult)
    }
    
    func resolveWorkoutLocationType(forStartWorkout intent: INStartWorkoutIntent, with completion: (INWorkoutLocationTypeResolutionResult) -> Void) {
        let resolutionResult = INWorkoutLocationTypeResolutionResult.success(with: INWorkoutLocationType.indoor)
        completion(resolutionResult)
    }
    
    func resolveWorkoutName(forStartWorkout intent: INStartWorkoutIntent, with completion: (INSpeakableStringResolutionResult) -> Void) {
        // The INSpeakableString's identifier would match the Vocabulary item synced up in the AppIntentVocabulary.plist
        let resolvedWorkoutName = INSpeakableString(identifier: "latissimus_dorsi_pulldown", spokenPhrase: "Lat Pulldown", pronunciationHint: "lat pull down")
        let resolutionResult = INSpeakableStringResolutionResult.success(with: resolvedWorkoutName)
        completion(resolutionResult)
    }
    
    // Once resolution is completed, perform validation on the intent and provide confirmation (optional).
    
    func confirm(startWorkout startWorkoutIntent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .ready, userActivity: userActivity)
        completion(response)
    }
    
    // Handle the completed intent (required).
    
    func handle(startWorkout startWorkoutIntent: INStartWorkoutIntent, completion: (INStartWorkoutIntentResponse) -> Void) {
        // Implement your application logic to start a workout here.
        
        // Update application state by updating NSUserActivity.
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INStartWorkoutIntent.self))
        let response = INStartWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // Implement handlers for each intent you wish to handle.  As an example for workouts, you may wish to handle pause, resume, cancel, and end.
    
    // MARK: - INPauseWorkoutIntentHandling
    
    func handle(pauseWorkout pauseWorkoutIntent: INPauseWorkoutIntent, completion: (INPauseWorkoutIntentResponse) -> Void) {
        // Implement your application logic to pause a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INPauseWorkoutIntent.self))
        let response = INPauseWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INResumeWorkoutIntentHandling
    
    func handle(resumeWorkout resumeWorkoutIntent: INResumeWorkoutIntent, completion: (INResumeWorkoutIntentResponse) -> Void) {
        // Implement your application logic to resume a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INResumeWorkoutIntent.self))
        let response = INResumeWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INCancelWorkoutIntentHandling
    
    func handle(cancelWorkout cancelWorkoutIntent: INCancelWorkoutIntent, completion: (INCancelWorkoutIntentResponse) -> Void) {
        // Implement your application logic to cancel a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INCancelWorkoutIntent.self))
        let response = INCancelWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
    
    // MARK: - INEndWorkoutIntentHandling
    
    func handle(endWorkout endWorkoutIntent: INEndWorkoutIntent, completion: (INEndWorkoutIntentResponse) -> Void) {
        // Implement your application logic to end a workout here.
        
        let userActivity = NSUserActivity(activityType: NSStringFromClass(INEndWorkoutIntent.self))
        let response = INEndWorkoutIntentResponse(code: .continueInApp, userActivity: userActivity)
        completion(response)
    }
}

