//
//  PhotosNetwork.swift
//  CookpadPhotoViewer
//
//  Created by Rebouh Aymen on 20/04/2017.
//  Copyright © 2017 Aymen. All rights reserved.
//

import Foundation
import Decodable
import Alamofire
import RxSwift
import RxCocoa

struct PhotosNetwork: PhotosAPI {
    
    func getStarters() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            request(Router.getStarters)
                .responseJSON { jsonResponse in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    switch jsonResponse.result {
                        case .success(let value):
                            do {
                                let json = value as! NSDictionary
                                let jsonPhotos = json["photos"]
                                let photos = try [Photo].decode(jsonPhotos!)
                                let photosResult: Result<[Photo]> = .success(photos)
                                observer.onNext(photosResult.value!)
                            
                            } catch let error {
                                print(error)
                                observer.onError(error)
                            }
                        case .failure(let error):
                            observer.onError(error)
                        }
                    
                        observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
    
    func getMainCourses() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            request(Router.getMainCourses)
                .responseJSON { jsonResponse in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    switch jsonResponse.result {
                    case .success(let value):
                        do {
                            let json = value as! NSDictionary
                            let jsonPhotos = json["photos"]
                            let photos = try [Photo].decode(jsonPhotos!)
                            let photosResult: Result<[Photo]> = .success(photos)
                            observer.onNext(photosResult.value!)
                            
                        } catch let error {
                            print(error)
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                    observer.onCompleted()
            }
            
            return Disposables.create()
        }

    }
    
    func getDesserts() -> Observable<[Photo]> {
        return Observable<[Photo]>.create { observer in
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            
            request(Router.getDesserts)
                .responseJSON { jsonResponse in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    switch jsonResponse.result {
                    case .success(let value):
                        do {
                            let json = value as! NSDictionary
                            let jsonPhotos = json["photos"]
                            let photos = try [Photo].decode(jsonPhotos!)
                            let photosResult: Result<[Photo]> = .success(photos)
                            observer.onNext(photosResult.value!)
                            
                        } catch let error {
                            print(error)
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                    observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
}