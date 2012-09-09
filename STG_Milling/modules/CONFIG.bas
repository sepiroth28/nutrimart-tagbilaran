Attribute VB_Name = "CONFIG"
Public DBSERVER As String
Public DB_NAME As String
Public DB_USERNAME As String
Public DB_PASSWORD As String

Public Const PAYMENT_COD As Integer = 1
Public Const PAYMENT_ACCOUNT_RECEIVABLE As Integer = 2

Public Const ITEM_IN_STOCK As Integer = 1
Public Const ITEM_OUT_OF_STOCK As Integer = 0

Public Const DEALER As String = "dealer"
Public Const CONSUMER As String = "consumer"

Public Const ADMIN As String = "admin"
Public Const USER As String = "user"

Public Const PRICERULE_ACTIVE_ITEM As String = "item"
Public Const PRICERULE_ACTIVE_CUSTOMER As String = "customer"

Public Const STOCK_IN_DATE As String = "stockindate"
Public Const QUICK_REPORT_DATE As String = "quickreportdate"
Public Const STOCK_IN_TRANSACTION As String = "stock_in"
Public Const STOCK_OUT_TRANSACTION As String = "stock_out"
Public Const CONVERT_IN As String = "convert_in"
Public Const CONVERT_OUT As String = "convert_out"
Public Const RETURN_ITEM As String = "return_stock"
Public Const customer As String = "customer"
Public Const Item As String = "item"

Sub initializedConfig()
Dim file_name As String
Dim intEmpFileNbr As Integer
Dim server As String
Dim dba_name As String
Dim dba_username As String
Dim dba_pass As String

intEmpFileNbr = FreeFile
file_name = App.Path & "\config.dat"

Open file_name For Input As #intEmpFileNbr

Input #intEmpFileNbr, server, dba_name, dba_username, dba_pass

 DBSERVER = server
 DB_NAME = dba_name
 DB_USERNAME = dba_username
 DB_PASSWORD = dba_pass

Close #intEmpFileNbr

End Sub





