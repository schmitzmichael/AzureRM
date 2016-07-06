@{ 
    AllNodes = @( 
        @{ 
            Nodename = 'localhost'
            PSDscAllowDomainUser = $true
        }
    )

    NonNodeData = @{

        UserData = @'
UserName,Password,Dept,Title
Alice,P@ssw0rd,Accounting,Manager
Bob,P@ssw0rd,IT,Manager
Charlie,P@ssw0rd,Marketing,Manager
Debbie,P@ssw0rd,Operations,Manager
Eddie,P@ssw0rd,Accounting,Specialist
Frieda,P@ssw0rd,IT,Specialist
George,P@ssw0rd,Marketing,Specialist
Harriet,P@ssw0rd,Operations,Specialist
adm-Migadmin,P@ssw0rd,_ServiceAccounts,ServiceAccount
'@

        RootOUs = 'Accounting','IT','Marketing','Operations','Migration','ServiceAccounts'
        ChildOUs = 'Users','Computers','Groups'
        TestObjCount = 10

    }
} 
