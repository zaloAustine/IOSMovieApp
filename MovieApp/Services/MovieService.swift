//
//  MovieService.swift
//  MovieApp
//
//  Created by AUSTINE on 22/09/2021.
//  Copyright © 2021 AUSTINE. All rights reserved.
//

import Foundation

protocol MovieService {
    func fetchMovieList(from endpoint:MovieListEndPoint,completion :@escaping (Result<MovieResponse,MovieError>)->())
    
    func fetchMovie(id : Int ,completion :@escaping (Result<Movie,MovieError>)->())
    
    func searchMoivie(query:String,completion :@escaping (Result<MovieResponse,MovieError>)->())
}


enum MovieListEndPoint:String {
    
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description:String{
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Up coming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError :Error {
    case apiError
      case invalidEndpoint
      case invalidResponse
      case noData
      case serializationError
      
      var localizedDescription: String {
          switch self {
          case .apiError: return "Failed to fetch data"
          case .invalidEndpoint: return "Invalid endpoint"
          case .invalidResponse: return "Invalid response"
          case .noData: return "No data"
          case .serializationError: return "Failed to decode data"
          }
      }
      
      var errorUserInfo: [String : Any] {
          [NSLocalizedDescriptionKey: localizedDescription]
      }
        
}
