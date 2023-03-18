import UIKit

//DispatchQueue.global().async {
//    sleep(2)
//    print("async: Inside")
//}
//print("async: Outside")

//DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
//    print("First delay of 5 seconds")
//}
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//    print("Delayed by 2 seconds")
//}

let queue = DispatchQueue.global()
let group = DispatchGroup()

//queue.async(group: group) {
//    sleep(3)
//    print("Task 1 done")
//}
//
//queue.async(group: group) {
//    sleep(1)
//    print("Task 2 done")
//}
//
//group.wait()
//print("All tasks done")
//print("Continue Execution")

group.enter()
queue.async(group: group) {
    sleep(3)
    print("Task 1 done")
    group.leave()
}

group.enter()
queue.async(group: group) {
    sleep(1)
    print("Task 2 done")
    group.leave()
}

group.notify(queue: queue) {
    print("All tasks done")
}
print("Continue Execution")
