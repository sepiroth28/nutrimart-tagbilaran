Attribute VB_Name = "Helper_Payment"
Function getTotalPaymentReceiveToday(details_date As Date) As Double
    Dim rs As New ADODB.Recordset
    Dim sql As String
    
    sql = "SELECT SUM(amount) FROM `payment_records` " & _
          "  Where DATE_FORMAT(payment_date, '%Y-%m-%d') = '" & Format(details_date, "yyyy-mm-dd") & "'" & _
          "  GROUP BY payment_date"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getTotalPaymentReceiveToday = rs.Fields(0).value
    End If
End Function
'Where DATE_FORMAT(payment_date, '%Y-%m-%d') = CURDATE()
Sub loadPaymentDetailsOnListView(lsv As ListView, details_date As Date, Optional sort As String)
    Dim rs As New ADODB.Recordset
    Dim sql As String
    Dim list As ListItem
    
    If sort = "" Then
    
    sql = "SELECT pr.`id`, pr.`sales_order_no`,c.customers_name, pr.`amount`, pr.`balance`, pr.`payment_date`, pr.`remarks`,pr.received_by " & _
          "  FROM `payment_records` pr " & _
          "  LEFT JOIN stock_out_transaction sot " & _
          "  ON pr.sales_order_no = sot.sales_order_no " & _
          "  LEFT JOIN customers c " & _
          "  ON sot.responsible_customer = c.customers_id " & _
          " WHERE DATE_FORMAT(pr.payment_date, '%Y-%m-%d') = '" & Format(details_date, "yyyy-mm-dd") & "'"
    Else
    
    sql = "SELECT pr.`id`, pr.`sales_order_no`,c.customers_name, pr.`amount`, pr.`balance`, pr.`payment_date`, pr.`remarks`,pr.received_by " & _
          "  FROM `payment_records` pr " & _
          "  LEFT JOIN stock_out_transaction sot " & _
          "  ON pr.sales_order_no = sot.sales_order_no " & _
          "  LEFT JOIN customers c " & _
          "  ON sot.responsible_customer = c.customers_id " & _
          " WHERE DATE_FORMAT(pr.payment_date, '%Y-%m-%d') = '" & Format(details_date, "yyyy-mm-dd") & "' order by " & sort & ""
    End If
    Set rs = db.execute(sql)
    lsv.ListItems.Clear
    On Error Resume Next
    If rs.RecordCount > 0 Then
        Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
                list.SubItems(1) = rs.Fields(1).value
                list.SubItems(2) = rs.Fields(2).value
                list.SubItems(3) = rs.Fields(3).value
                list.SubItems(4) = rs.Fields(4).value
                list.SubItems(5) = rs.Fields(5).value
                list.SubItems(6) = rs.Fields("remarks").value
                list.SubItems(7) = rs.Fields("received_by").value
                Dim so As New Sales
                so.loadSalesOrder (rs.Fields(1).value)
                list.SubItems(8) = FormatDateTime(so.date_transact, vbShortDate)
                Set so = Nothing
            rs.MoveNext
        Loop
    End If
End Sub

Sub loadPaymentTotalsInfoReceivedBy(lsv As ListView, payment_data As Date)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    
    sql = "SELECT received_by,sales_order_no,SUM(amount) as totals FROM `payment_records` where payment_date = '" & Format(payment_data, "yyyy-mm-dd") & "'  group by received_by"
    Set rs = db.execute(sql)
    lsv.ListItems.Clear
    
    On Error Resume Next
    If rs.RecordCount > 0 Then
        Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , rs.Fields("received_by").value)
            list.SubItems(1) = FormatNumber(rs.Fields("totals").value, 2)
            list.ListSubItems(1).ForeColor = vbRed
        rs.MoveNext
        Loop
    End If
    
End Sub


Sub loadSOPaymentHistory(lsv As ListView, so As String)
    Dim sql As String
    
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    
    sql = "SELECT pr.id, pr.sales_order_no, pr.amount, pr.balance, pr.payment_date, IF(pr.balance=0,'fully paid','unsettled') remarks, received_by " & _
            " FROM `payment_records` pr " & _
            " where pr.sales_order_no = '" & so & "' order by payment_date ASC"
    Set rs = db.execute(sql)
    lsv.ListItems.Clear
    
    On Error Resume Next
    'id, sales_order_no, amount, balance, payment_date, remarks, received_by
    If rs.RecordCount > 0 Then
        Do Until rs.EOF
        
            Set list = lsv.ListItems.Add(, , rs.Fields("id").value)
              
            list.SubItems(1) = rs.Fields("sales_order_no")
            list.SubItems(2) = FormatNumber(rs.Fields("amount").value, 2)
            list.SubItems(3) = FormatNumber(rs.Fields("balance").value, 2)
            list.SubItems(4) = rs.Fields("payment_date")
            list.SubItems(5) = rs.Fields("remarks")
            list.SubItems(6) = rs.Fields("received_by")
            
            rs.MoveNext
        Loop
    End If
    
    Set rs = Nothing
    
End Sub






