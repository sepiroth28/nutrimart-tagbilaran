Attribute VB_Name = "Helper_Customers"
Sub loadAllCustomersToListview(lsv As ListView)
    Dim list As ListItem
    Dim rs As New ADODB.Recordset
    Dim customer As New Customers
    lsv.ListItems.Clear
    Set Collection = getAllCustomersCollection
        For Each customer In Collection
            Set list = lsv.ListItems.Add(, , customer.customers_id)
            list.SubItems(1) = customer.customers_name
            list.SubItems(2) = customer.customers_add
            list.SubItems(3) = customer.customers_number
            list.SubItems(4) = customer.dealers_type
        Next
End Sub

Sub loadAllCustomersToListviewHidden(lsv As ListView)
    Dim list As ListItem
    Dim rs As New ADODB.Recordset
    Dim customer As New Customers
    lsv.ListItems.Clear
    Set Collection = getAllCustomersCollectionHidden
        For Each customer In Collection
            Set list = lsv.ListItems.Add(, , customer.customers_id)
            list.SubItems(1) = customer.customers_name
            list.SubItems(2) = customer.customers_add
            list.SubItems(3) = customer.customers_number
            list.SubItems(4) = customer.dealers_type
        Next
End Sub
Function getAllCustomersCollectionHidden() As CustomersCollection
    Dim sql As String
    Dim data As ADODB.Recordset
    Dim customers_col As New CustomersCollection
    Dim temp_customers As New Customers
    
    sql = "SELECT * FROM customers WHERE visible = 0 ORDER BY customers_name ASC"
    Set data = db.execute(sql)
    On Error Resume Next
    Do Until data.EOF
        With temp_customers
            .customers_id = data.Fields("customers_id").value
            .customers_name = data.Fields("customers_name").value
            .customers_add = data.Fields("customers_add").value
            .customers_number = data.Fields("customers_number").value
            .dealers_type = data.Fields("dealers_type").value
        End With
         customers_col.Add temp_customers, data.Fields("customers_id").value
         data.MoveNext
    Loop
   
    Set getAllCustomersCollectionHidden = customers_col
End Function

Function searchCustomer(customername As String, lsv As ListView)
    Dim sql As String
    Dim list As ListItem
    Dim rs As New ADODB.Recordset
     sql = "SELECT * FROM customers WHERE customers_name like '%" & Replace(customername, "'", "''") & "%' AND visible = 1"
    Set rs = db.execute(sql)
    On Error Resume Next
    lsv.ListItems.Clear
    Do Until rs.EOF
    Set list = lsv.ListItems.Add(, , rs.Fields("customers_id").value)
        list.SubItems(1) = rs.Fields("customers_name").value
        list.SubItems(2) = rs.Fields("customers_add").value
        list.SubItems(3) = rs.Fields("customers_number").value
        list.SubItems(4) = rs.Fields("dealers_type").value
    rs.MoveNext
    Loop
    Set rs = Nothing
End Function
Function getAllCustomersCollection() As CustomersCollection
    Dim sql As String
    Dim data As ADODB.Recordset
    Dim customers_col As New CustomersCollection
    Dim temp_customers As New Customers
    
    sql = "SELECT * FROM customers WHERE visible = 1 ORDER BY customers_name ASC"
    Set data = db.execute(sql)
    On Error Resume Next
    Do Until data.EOF
        With temp_customers
            .customers_id = data.Fields("customers_id").value
            .customers_name = data.Fields("customers_name").value
            .customers_add = data.Fields("customers_add").value
            .customers_number = data.Fields("customers_number").value
            .dealers_type = data.Fields("dealers_type").value
        End With
         customers_col.Add temp_customers, data.Fields("customers_id").value
         data.MoveNext
    Loop
   
    Set getAllCustomersCollection = customers_col
End Function

Sub deleteCustomer(customer_id As Integer)
    
        db.execute "DELETE FROM customers WHERE customers_id = " & customer_id
   
End Sub
Function searchCustomersByName(customers_name As String) As ADODB.Recordset
    Dim sql As String
    Dim rs As New ADODB.Recordset
    sql = "SELECT * FROM `customers` WHERE customers_name like '%" & Replace(customers_name, "'", "''") & "%' AND visible = 1"
            
    Set rs = db.execute(sql)
    Set searchCustomersByName = rs
End Function
Sub loadCustomerRSToListView(lsv As ListView, rs As ADODB.Recordset)

Dim list As ListItem
lsv.ListItems.Clear
    Do Until rs.EOF
        'customers_id, customers_name, customers_add, customers_number
        Set list = lsv.ListItems.Add(, , rs.Fields("customers_id").value)
            list.SubItems(1) = rs.Fields("customers_name").value
            list.SubItems(2) = rs.Fields("customers_add").value
            list.SubItems(3) = rs.Fields("customers_number").value
            list.SubItems(4) = rs.Fields("dealers_type").value
        rs.MoveNext
    Loop
End Sub

Sub createNewCustomer(cbocustype As ComboBox)
With cbocustype
.Text = "consumer"
.Enabled = False
End With
End Sub

Sub auto_detect_agent_of_this_municipality(cbomunicipality As ComboBox, txtagent As TextBox, lsvAgent As ListView)
Dim rs As New ADODB.Recordset
Dim sql As String
sql = "select m.municipal_id,m.municipal_name,ma.agent_id,ma.municipal_id,a.agent_id,a.Name from municipalities m inner join municipal_agent ma on m.municipal_id=ma.municipal_id inner join agent a on ma.agent_id=a.agent_id where m.municipal_name='" & cbomunicipality & "'"
Set rs = db.execute(sql)
txtagent = rs.Fields("Name").value
lsvAgent.SelectedItem.Text = rs.Fields("agent_id").value
'MsgBox (lsvAgent.SelectedItem.Text)
'Set list = lsvAgent.ListItems.Add(, , rs.Fields("agent_id").Value)
'            'list.SubItems(1) = rs.Fields("Name").Value

End Sub

Sub loadcustomers_to_verify(lsv As ListView)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim lst As ListItem
    Dim temp As Integer
    sql = "SELECT * FROM customers c inner join verified_customer vc on c.customers_id=vc.customers_id ORDER BY customers_name ASC"
    Set rs = db.execute(sql)
'    On Error Resume Next
    lsv.ListItems.Clear
    Do Until rs.EOF
    temp = rs.Fields("verefied").value
        Set lst = lsv.ListItems.Add(, , rs.Fields("customers_id").value)
            If temp = 1 Then
                lst.Checked = True
            Else
                lst.Checked = False
            End If
            lst.SubItems(1) = rs.Fields("customers_name").value
        rs.MoveNext
    Loop
    Set rs = Nothing
End Sub
