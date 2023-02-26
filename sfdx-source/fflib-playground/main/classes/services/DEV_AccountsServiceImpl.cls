public inherited sharing class DEV_AccountsServiceImpl
	implements DEV_IAccountsService
{
	@TestVisible
	private static Date todaysDate = Date.today();

	public void setDescription(Set<Id> accountIds)
	{
		fflib_ISObjectUnitOfWork uow = DEV_Application.UnitOfWork.newInstance();

		for (Account acct : DEV_AccountsSelector.newInstance().selectById(accountIds))
		{
			acct.Description = 'Account updated on: ' + todaysDate.format();
			uow.registerDirty(acct);
		}

		uow.commitWork();
	}
}