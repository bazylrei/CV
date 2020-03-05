import XCTest
@testable import CV

class CVListViewModelTests: XCTestCase {
    
    var router: MockRouter! = MockRouter()
    var api: MockAPI! = MockAPI()
    var viewModel: CVListViewModel!
    
    override func setUp() {
        viewModel = CVListViewModel(api: api, appRouter: router)
    }
    
    override func tearDown() {
        router = nil
        api = nil
        viewModel = nil
    }
    
    func testHeaderTitle() {
        XCTAssertEqual(viewModel.title, "CV list")
    }
    
    func testFetchCVList() {
        viewModel.fetchCVList { [weak self] in
            XCTAssertEqual(self!.viewModel.numberOfRows, 2)
            let cv = self!.viewModel.cv(at: 1)
            XCTAssertEqual(cv.person.firstName, "Matthew")
            XCTAssertEqual(self!.router.presentCount, 0)
            self!.viewModel.presentDetails(for: cv)
            XCTAssertEqual(self!.router.presentCount, 1)
        }
    }
}

class MockAPI: CVAPIType {
    func fetchCVs(completion: @escaping (([CV]) -> Void)) {
        completion([CV.exampleCV, CV.emptyCVJustPerson])
    }
}

class MockRouter: AppRouterType {
    var presentCount = 0
    var popCount = 0
    func presentCVDetails(with cv: CV) {
        presentCount += 1
    }
    
    func pop() {
        popCount += 1
    }
    
    
}
