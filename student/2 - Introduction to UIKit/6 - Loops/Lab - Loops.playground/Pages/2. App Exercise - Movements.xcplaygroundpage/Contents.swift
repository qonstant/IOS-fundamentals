/*:
## App Exercise - Movements
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Suppose your app contains a list of different movements that can be tracked. You want to display each item in the list to the user. Use a for-in loop to loop through `movements` below and print each movement.
 */
let movements: [String] = ["Walking", "Sprinting", "Crossing", "Climbing", "Swimming", "Cycling"]
for movement in movements {
    print(movement)
}
//:  Now suppose your app uses a dictionary to keep track of your average heart rate during each of the movements in `movements`. The keys correspond to the movements listed above, and the values correspond to the average heart rate that your fitness tracker has monitored during the given movement. Loop through `movementHeartRates` below, printing statements telling the user his/her average heart rate during each exercise.
var movementHeartRates: [String: Int] = ["Walking": 60, "Sprinting": 150, "Crossing": 120, "Climbing": 80, "Swimming": 100, "Cycling": 90]
for (movement, heartRate) in movementHeartRates {
    print("During  \(movement) your average hearth rate is \(heartRate) ")
}
/*:
[Previous](@previous)  |  page 2 of 6  |  [Next: Exercise - While Loops](@next)
 */
