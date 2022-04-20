//
//  Artist.swift
//  Lesson6
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

struct Artist {

  let identifier: Int
  let name: String
  let albums: [Album]

  struct Album {

    let name: String
    let songs: [Song]
    let date: Date
  }

  struct Song {

    let name: String
    let duration: TimeInterval
  }
}
