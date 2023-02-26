public interface DEV_IAccountsSelector extends fflib_ISObjectSelector
{
	List<Account> selectById(Set<Id> idSet);
	List<Account> selectByName(Set<String> nameSet);
}