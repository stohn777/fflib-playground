public class DEV_Application
{
	// Configure and create the UnitOfWorkFactory for this DEV_Application
	public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
		new fflib_Application.UnitOfWorkFactory(
			new List<SObjectType> {
				Account.SObjectType
			});

	// Configure and create the ServiceFactory for this DEV_Application
	public static final fflib_Application.ServiceFactory Service = 
		new fflib_Application.ServiceFactory( 
			new Map<Type, Type> {
				DEV_IAccountsService.class => DEV_AccountsServiceImpl.class
			});

	// Configure and create the SelectorFactory for this DEV_Application
	public static final fflib_Application.SelectorFactory Selector = 
		new fflib_Application.SelectorFactory(
			new Map<SObjectType, Type> {
					Account.SObjectType => DEV_AccountsSelector.class
			});

	// Configure and create the DomainFactory for this DEV_Application
	public static final fflib_Application.DomainFactory Domain = 
		new fflib_Application.DomainFactory(
			DEV_Application.Selector,
			new Map<SObjectType, Type> {

			});
}
