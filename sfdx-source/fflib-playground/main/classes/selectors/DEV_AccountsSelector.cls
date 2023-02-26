public class DEV_AccountsSelector
	extends fflib_SObjectSelector
	implements DEV_IAccountsSelector
{
	public static DEV_IAccountsSelector newInstance()
	{
		return (DEV_IAccountsSelector) DEV_Application.Selector.newInstance(Account.SObjectType);
	}
	
	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Account.Id,
			Account.Name,
			Account.Description
		};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Account.SObjectType;
	}

	public List<Account> selectById(Set<Id> idSet)
	{
		return (List<Account>) selectSObjectsById(idSet);
	}
		
	public List<Account> selectByName(Set<String> nameSet)
	{
		return
			(List<Account>)
			Database.query(
				''
			);
	}	
}