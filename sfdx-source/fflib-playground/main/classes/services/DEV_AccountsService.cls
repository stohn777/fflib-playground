public inherited sharing class DEV_AccountsService
{
	private static DEV_IAccountsService service()
	{
		return (DEV_IAccountsService) DEV_Application.Service.newInstance(DEV_IAccountsService.class);
	}

	public static void setDescription(Set<Id> accountIds)
	{
		service().setDescription(accountIds);
	}
}