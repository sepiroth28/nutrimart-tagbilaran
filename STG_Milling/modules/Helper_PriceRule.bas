Attribute VB_Name = "Helper_PriceRule"
Sub load_rule_type(cbo As ComboBox)
Dim sql As String
Dim rs As ADODB.Recordset
sql = "select * from rule_type order by name"
Set rs = db.execute(sql)

cbo.Clear
    Do Until rs.EOF
    cbo.AddItem rs.Fields("name").value
    rs.MoveNext
    Loop
    Set rs = Nothing
End Sub

Sub load_charge_type(cbo As ComboBox)
cbo.AddItem "fixed amount"
cbo.AddItem "percentage"
End Sub



'Sub populate_price_rule(lsv As ListView)

Sub addThisCustomerToPriceRule(rule_id As Integer, customer_id As String)
Dim insert As String
insert = "INSERT INTO pricerule_customer VALUES (" & rule_id & "," & customer_id & ")"
db.execute insert
End Sub

Sub addThisItemToPriceRule(rule_id As Integer, item_id As String)
Dim insert As String
insert = "INSERT INTO pricerule_product VALUES (" & rule_id & "," & item_id & ")"
db.execute insert

End Sub

Function searchIfCurrentSalesIncludeInPriceRule(activeSales As Sales) As Integer
    
End Function

Sub applyActiveAutoPriceRule()
Dim items As New cart_items
Dim item_rules As New Collection
Dim customer_rules As New Collection

Set item_rules = isItemsHasPriceRule(activeSales.items_sold)
Set customer_rules = isCustomerHasPriceRule(activeSales.sold_to.customers_id)

If customer_rules.Count Then
    For Each items In activeSales.items_sold
       
        Dim pricerule_ids As New Collection
        Set pricerule_ids = getPriceRuleOfThisItem(items.Item.item_id)
        If pricerule_ids.Count Then
            If pricerule_ids.Count = 1 Then
                 Dim pricerule As New price_rule
                 pricerule.load_price_rule (Val(pricerule_ids.Item(1)))
                 If pricerule.auto_apply Then
                    items.discount = pricerule.value
                 End If
            End If
        End If
    Next
End If

End Sub



Function isCustomerHasPriceRule(customer_id As Integer) As Collection
Dim sql As String
Dim rs As New ADODB.Recordset

sql = "SELECT * FROM pricerule_customer WHERE cutomer_id = " & customer_id & " GROUP BY price_id"
Set rs = db.execute(sql)
If rs.RecordCount Then
    Set isCustomerHasPriceRule = New Collection
    Do Until rs.EOF
        isCustomerHasPriceRule.Add "" & rs.Fields(0).value
    rs.MoveNext
    Loop
End If

'sql = "SELECT * FROM `pricerule_customer` WHERE customer_id = '*'"

Set rs = Nothing

End Function

Function getPriceRuleOfThisItem(item_id As Integer) As Collection
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    sql = "SELECT * FROM `pricerule_product` WHERE item_code = '" & item_id & "'"
    Set rs = db.execute(sql)
    If rs.RecordCount Then
    Set getPriceRuleOfThisItem = New Collection
        Do Until rs.EOF
            getPriceRuleOfThisItem.Add "" & rs.Fields(0).value
        rs.MoveNext
        Loop
    End If
    
    Set rs = Nothing
End Function

Function isItemsHasPriceRule(items_id As cart) As Collection
Dim sql As String
Dim rs As New ADODB.Recordset
Dim ids As String
Dim items As New cart_items
Dim item_id_collection As New Collection
Dim temp_array() As String
Dim x As Integer
Dim all As Boolean

all = False
Set isItemsHasPriceRule = New Collection

For Each items In items_id
    item_id_collection.Add "" & items.Item.item_id
Next

If item_id_collection.Count Then
    If item_id_collection.Count = 1 Then
       sql = "SELECT * FROM `pricerule_product` WHERE item_code = '" & item_id_collection.Item(1) & "' GROUP BY price_id"
    Else
    ReDim temp_array(item_id_collection.Count - 1)
    x = 0
    For Each i In item_id_collection
        temp_array(x) = "" & i
        x = x + 1
    Next
    
       ids = Join(temp_array, ",")
       sql = "SELECT * FROM `pricerule_product` WHERE item_code IN (" & ids & ") GROUP BY price_id"
    End If
    
        Set rs = db.execute(sql)
        If rs.RecordCount Then
            Do Until rs.EOF
                isItemsHasPriceRule.Add "" & rs.Fields("price_id").value
            rs.MoveNext
            Loop
        End If
End If

End Function
