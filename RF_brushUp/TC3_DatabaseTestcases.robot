*** Settings ***
Library    DatabaseLibrary    




*** Test Cases ***

TC1
    Connect To Database    pymysql    dbName=prasad_database    dbUsername=sunnydiwane    dbPassword=Prasad@1994    dbHost=db4free.net    dbPort=3306
    Table Must Exist    Animals
    Disconnect From Database        