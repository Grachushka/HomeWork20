import UIKit

/*
 Задание1:
 Есть число (например, 65) и serial queue.
 Запустить асинхронно минимум три арифметические действия над этим числом и после выполнения всех этих действий вывести число
 */

let serialQueue = DispatchQueue(label: "Ser q")
//Асинхронный запуск арифметических действий над числом

var a = 65
serialQueue.async {
    print("\(a)+1000")
    a += 1000
}
serialQueue.async {
    print("\(a)/57")
    a /= 57
}
serialQueue.async {
    print("\(a)*3")
    a *= 3
}
serialQueue.async {
    print("\(a)-4")
    a -= 4
}

serialQueue.sync {
    print("\(a)")

}

/*
 Задание2:
 Имеется структура с двумя числами и одна cuncurrnet queue.
 Параллельно произвести три арифметические действия над этими числами, потом просуммировать эти числа и вывести в консоль.
 */


struct DispatchQue {

      var firstNumber: Int = 100
      var lastNumber: Int = 120
      let concurrentQueue = DispatchQueue(label: "Conc q", qos: .default, attributes: [.concurrent], autoreleaseFrequency: .never, target: nil)


}
let group = DispatchGroup()

var object = DispatchQue()

group.enter()
object.concurrentQueue.async {
    object.firstNumber += 7
    object.lastNumber += 4
    print("1: \(object.firstNumber + object.lastNumber)")
    group.leave()
}
group.enter()
object.concurrentQueue.async {
    object.firstNumber *= 7
    object.lastNumber -= 4
    print("2: \(object.firstNumber + object.lastNumber)")
    group.leave()
}
group.enter()
object.concurrentQueue.async {
    object.firstNumber /= 7
    object.lastNumber /= 4
    print("3: \(object.firstNumber + object.lastNumber)")
    group.leave()

}

group.notify(queue: .main) {
    
   print(object.firstNumber + object.lastNumber)
}






