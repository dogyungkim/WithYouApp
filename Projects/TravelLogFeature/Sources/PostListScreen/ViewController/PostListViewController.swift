//
//  PostListViewController.swift
//  TravelLogFeature
//
//  Created by bryan on 7/18/24.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import Core
import Domain
import Foundation


public final class PostListViewController : BaseViewController {
    
    let postListView = PostListView()
    
    let viewModel : PostListViewmodel
    
    var coordinator : Coordinator?
    
    public init(viewModel: PostListViewmodel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadPost()
    }
    
    public override func setUp() {
        view.addSubview(postListView)
        view.backgroundColor = .white
        postListView.travelTitle.text = viewModel.log.title
        postListView.dateTitle.text = "\(viewModel.log.startDate.replacingOccurrences(of: "-", with: ".")) - \(viewModel.log.endDate.replacingOccurrences(of: "-", with: "."))"
    }
    
    public override func setLayout() {
        postListView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    public override func setFunc() {
        //CollectionView 연결
        viewModel.posts.bind(to: postListView.collectionView.rx.items(cellIdentifier: PostListCell.cellId, cellType: PostListCell.self)) { index, item, cell in
            cell.bind()
        }
        .disposed(by: disposeBag)
        
        //Cell 클릭 이벤트
        
        postListView.collectionView.rx.modelSelected(PostThumbnail.self)
            .subscribe(onNext: { postThumbnail in
                print(postThumbnail.postId)
            })
            .disposed(by: disposeBag)
    }
}