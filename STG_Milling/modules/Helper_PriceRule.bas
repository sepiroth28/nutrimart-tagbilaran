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

Sub addThisCustomerToPriceRule(rule_id As Integer, customer_id As Integer)
Dim insert As String
insert = "INSERT INTO pricerule_customer VALUES (" & rule_id & "," & customer_id & ")"
db.execute insert
End Sub

Sub addThisItemToPriceRule(rule_id As Integer, item_id As Integer)
Dim insert As String
insert = "INSERT INTO pricerule_product VALUES (" & rule_id & "," & item_id & ")"
db.execute insert
End Sub
