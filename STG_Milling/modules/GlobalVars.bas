Attribute VB_Name = "GlobalVars"
Public db As New db
Public editmode As Boolean
Public activeItemId As Integer
Public activeStockInList As StockInCollection
Public municipal_list As String
Public activemunicipalID As Integer
Public activecustomer As Integer
Public activeDiscout_id As Integer
Public activeSales As Sales
Public activeaseraccount_name As String
Public activeUser As New User_Account

Public activeDateTextbox As TextBox
Public activeDate As Date
Public activestockId As Integer
Public activeStockin_id_to_edit As Integer
Public activeReprintStockIN As Integer
Public activeSalesOrderForViewSales As String
Public activeSalesOrderForViewSalesDetails As String
Public activeSalesOrderForPaymentHistory As String
Public activeCustomerIdForRebate As Integer
Public overwrite As Boolean
Public activeAssociatedItemCode As String
Public activeTextbox As TextBox
'convert to retail variables
Public parent_id As String
Public unit_of_measure_holder As String
Public item_description_holder As String

'rebate variable
Public rebate_grand_total As Double
Public rebate_grand_total_qty As Double

Public selectedSOForHistory As String

Public customer_id_for_list_of_account_receivable As Integer
Public newcustomer As Boolean
Public editManufacturer As Boolean
Public edit_manufacturer_id As Integer

Public amount_to_be_debt As Double
Public quick_create_new_customer As Boolean

'returnQty variables
Public returnQty As Double
Public AmountToDeductPerItem As Double

'price rule
Public active_affected_pricerule_list As String
Public edit_price_rule As Boolean
Public ToEditPriceRule As New price_rule

'quickreports variables
Public whichDate As String
Public activedatelabel As Label
Public date_type_selection As Boolean



Sub resetAllGlobalVars()
Set activeSales = New Sales
Set activeUser = New User_Account
Set activeStockInList = New StockInCollection
End Sub
