//
//  03_SessionCode.swift
//  AIOS
//
//  Created by Serge Kotov on 04.12.2022.
//

// Элементы функционального программирования
let sample3 = {
    
    // MARK: Пример #1
    
    let wordLog = ["GHbdtn", "Hello", nil, nil, "ПРювет"]
    
    var upperWorlds: [String] = []
    for word in wordLog {
        if word != nil {
            let WORD = word!.uppercased()
            upperWorlds.append(WORD)
        }
    }
    
    let filtered = wordLog.compactMap { $0?.uppercased() }
                          .filter { $0.first == "H"}
    
    print(upperWorlds)
    print(filtered)
    
    // MARK: Другие примеры представлены в файле 02_Candidates.swift
}
