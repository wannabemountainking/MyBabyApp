import UIKit

/*
 연습문제 ⭐️⭐️

 학생 이름 배열과 점수 배열을 zip 으로 묶어서

 70점 이상인 학생만 출력하는 코드를 짜봐요!
 let names = ["철수", "영희", "민수", "지수"]
 let scores = [85, 60, 92, 45]

 // 결과: ["철수: 85점", "민수: 92점"]
 */

let names = ["철수", "영희", "민수", "지수"]
let scores = [85, 60, 92, 45]
let scoreTuple = zip(names, scores)
	.filter { _, score in score >= 70 }
let scoreDict = Dictionary(uniqueKeysWithValues: scoreTuple)
print(scoreTuple)
print(scoreDict)
