
Try {
    
    // Create the IndividualRecordTypeMapper record for Banking_Customer record type agains person account
    IndividualRecordTypeMapper individualRTMapper = new IndividualRecordTypeMapper();
    individualRTMapper.FinServ__AccountRecordType__c = 'Banking_Customer';
    individualRTMapper.MasterLabel = 'Banking Customer';
    INSERT individualRTMapper;
    
    // Assign class_admin perm set to admin user
    User myUser = [SELECT id from user where email ='a.elawad97@gmail.com'];
    PermissionSet myPermSet = [SELECT id from PermissionSet where Name = 'class_admin'];
    UserPermissionSetAssignment myPermSetAssignment = new UserPermissionSetAssignment();
    myPermSetAssignment.PermissionSetId = myPermSet.Id;
    myPermSetAssignment.AssigneeId = myUser.Id;
    INSERT myPermSetAssignment;

    // create an personAccount for norma
    PersonAccount norma = new PersonAccount();
    norma.firstName = 'Norma';
    norma.lastName = 'Torres';
    norma.title = 'Retial Associate';
    INSERT norma;

}catch(DMLException e) {
    System.debug('An unexpected error has occurred: ' + e.getMessage());
}
