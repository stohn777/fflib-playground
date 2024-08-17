public with sharing class DEV_OpportunitiesTriggerHandler
	extends fflib_SObjectDomain
{
	public DEV_OpportunitiesTriggerHandler(List<Opportunity> sObjectList)
	{
		// Domain classes are initialised with lists to enforce bulkification throughout
		super(sObjectList);
	}

	public class Constructor implements fflib_SObjectDomain.IConstructable
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new DEV_OpportunitiesTriggerHandler(sObjectList);
		}
	}

	public override void onAfterInsert()
	{
		// Rollup.runFromTrigger();
	}

	public override void onAfterUpdate(Map<Id,SObject> existingRecords)
	{
		// Rollup.runFromTrigger();
	}

	public override void onBeforeDelete()
	{
		// Rollup.runFromTrigger();
	}
}