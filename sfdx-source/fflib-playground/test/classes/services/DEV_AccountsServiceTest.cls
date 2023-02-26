@IsTest
public class DEV_AccountsServiceTest
{
	@IsTest
	static void test()
	{
		Account acct = new Account(
			Id = fflib_IDGenerator.generate(Account.SObjectType)
		);

		fflib_ApexMocks mocks = new fflib_ApexMocks();

		DEV_IAccountsSelector mockAccountsSelector = (DEV_IAccountsSelector) mocks.mock(DEV_IAccountsSelector.class);
		mocks.startStubbing();
		mocks.when(mockAccountsSelector.sObjectType()).thenReturn(Account.SObjectType);
		mocks.when(mockAccountsSelector.selectById(new Set<Id> {acct.Id})).thenReturn(new List<Account> {acct});
		mocks.stopStubbing();

		fflib_ISObjectUnitOfWork mockUoW = (fflib_ISObjectUnitOfWork) mocks.mock(fflib_ISObjectUnitOfWork.class);

		DEV_Application.Selector.setMock(mockAccountsSelector);
		DEV_Application.UnitOfWork.setMock(mockUoW);

		DEV_AccountsServiceImpl.todaysDate = Date.newInstance(2023, 3, 14);

		Test.startTest();
		DEV_AccountsService.setDescription(new Set<Id> {acct.Id});
		Test.stopTest();

		Assert.areEqual('Account updated on: ' + Date.newInstance(2023, 3, 14).format(), acct.Description);
		((fflib_ISObjectUnitOfWork) mocks.verify(mockUoW, 1)).commitWork();
	}
}