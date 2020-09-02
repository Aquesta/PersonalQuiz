//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 31.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Избавиться от кнопкп возврата - done
    // 2. Передать сюда массив с выбранными ответами - done
    // 3. Определить то животное, которое встречается чаще всего
    // 4. Отобразить результаты - done
    // 5. Подумать над логикой определени индекса в соответсвии с диапазоном - done
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var descriptionOutlet: UILabel!
    
    var answersChoosen: [Answer] = []
    var resultAnimal: AnimalType = .dog
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        calculateResult(answers: answersChoosen)
        
        titleOutlet.text = "Вы - \(resultAnimal.rawValue)"
        descriptionOutlet.text = resultAnimal.definition
    }
    
    private func calculateResult(answers: [Answer]) {
        var animalTypesDict: [AnimalType: Int] = [
            .cat: 0,
            .dog: 0,
            .rabbit: 0,
            .turtle: 0,
        ]
        
        for animal in answers {
            switch animal.type {
                case .dog: animalTypesDict[.dog]! += 1
                case .cat: animalTypesDict[.cat]! += 1
                case .rabbit: animalTypesDict[.rabbit]! += 1
                default: animalTypesDict[.turtle]! += 1
            }
        }

        guard let result = animalTypesDict.sorted(by: { $0.1 > $1.1 }).first?.0 else { return }
    
        resultAnimal = result
    }
}
