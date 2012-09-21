Attribute VB_Name = "Helper_Quickreports"
Dim load_customer_sales As String

    'load_customer_sales = "SELECT c.customers_name,st.sales_order_no,i.item_code,id.item_name,so.qty_out,so.amount FROM customers c left join stock_out_transaction st on c.customers_id=st.responsible_customer left join stock_out_transaction_stock_out_items stsi on st.sales_order_no=stsi.sales_order_no left join stock_out so on stsi.stockout_id=so.stockout_id left join items i on so.item_id=i.item_id left join items_description id on i.item_code=id.item_code"

Sub loadSalesOfThisCustomer(cus_id As Integer, lsv As ListView, begining_date As String, ending_date As String)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    If date_type_selection = True Then
    
            sql = "SELECT c.customers_name,st.sales_order_no,st.delivery_date,i.item_code,id.item_name,so.qty_out,so.amount " & _
                  " FROM customers c left join stock_out_transaction st on c.customers_id=st.responsible_customer " & _
                  " left join stock_out_transaction_stock_out_items stsi on st.sales_order_no=stsi.sales_order_no " & _
                  " left join stock_out so on stsi.stockout_id=so.stockout_id left join items i on so.item_id=i.item_id " & _
                  " left join items_description id on i.item_code=id.item_code " & _
                  " WHERE DATE_FORMAT(st.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' and c.customers_id= " & cus_id & ""
    Else
            sql = "SELECT c.customers_name,st.sales_order_no,st.delivery_date,i.item_code,id.item_name,so.qty_out,so.amount " & _
                  " FROM customers c left join stock_out_transaction st on c.customers_id=st.responsible_customer " & _
                  " left join stock_out_transaction_stock_out_items stsi on st.sales_order_no=stsi.sales_order_no " & _
                  " left join stock_out so on stsi.stockout_id=so.stockout_id left join items i on so.item_id=i.item_id " & _
                  " left join items_description id on i.item_code=id.item_code " & _
                  " WHERE DATE_FORMAT(st.`delivery_date`,'%Y-%m-%d') between '" & (Format(begining_date, "yyyy-mm-dd")) & "' " & _
                  " and '" & (Format(ending_date, "yyyy-mm-dd")) & "' and c.customers_id= " & cus_id & " order by st.delivery_date"
    End If
    
    
    Set rs = db.execute(sql)
    Dim lst As ListItem
   lsv.ListItems.Clear
    
    Do Until rs.EOF
    On Error Resume Next
    Set list = lsv.ListItems.Add(, , rs.Fields("sales_order_no").value)
    
        list.SubItems(1) = rs.Fields("item_code").value
        list.SubItems(2) = rs.Fields("item_name").value
        list.SubItems(3) = rs.Fields("qty_out").value
        list.SubItems(4) = rs.Fields("amount").value
        list.SubItems(5) = rs.Fields("delivery_date").value
    rs.MoveNext
    Loop
    Set dtaQuickCustomerReport.DataSource = rs
    Set rs = Nothing
End Sub

Sub loadAllAccountReceivable(lsv As ListView)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim lst As ListItem
'        sql = "SELECT sot.responsible_customer,c.customers_name,sum(sot.net_total)as TOTAL," & _
'            "vtap.total_amount_paid,sum(sot.net_total)-vtap.total_amount_paid as balance FROM " & _
'            "account_receivable acr left join stock_out_transaction sot on acr.sales_order_no=sot.sales_order_no " & _
'            "left join customers c on sot.responsible_customer=c.customers_id left join `vtotal_amount_paid` vtap " & _
'            "on c.customers_id=vtap.responsible_customer group by sot.responsible_customer order by c.customers_name "

        sql = "SELECT sot.responsible_customer,c.customers_name,sum(sot.net_total)as TOTAL," & _
            "vtap.total_amount_paid,sum(sot.net_total)-vtap.total_amount_paid as balance," & _
            "if(sum(sot.net_total)-vtap.total_amount_paid IS null,sum(sot.net_total)," & _
            "sum(sot.net_total)-vtap.total_amount_paid) as BAL FROM account_receivable acr " & _
            "left join stock_out_transaction sot on acr.sales_order_no=sot.sales_order_no left join " & _
            "customers c on sot.responsible_customer=c.customers_id left join `vtotal_amount_paid` vtap " & _
            "on c.customers_id=vtap.responsible_customer group by sot.responsible_customer order by c.customers_name"
        Set rs = db.execute(sql)
        lsv.ListItems.Clear
        ACR_value_per_cus = 0
        
        Do Until rs.EOF
        On Error Resume Next
        Set lst = lsv.ListItems.Add(, , rs.Fields("customers_name").value)
                lst.SubItems(1) = rs.Fields("BAL").value
                
            ACR_value_per_cus = ACR_value_per_cus + rs.Fields("BAL").value
            rs.MoveNext
            Loop
            'Set dtaAccountReceivable.DataSource = rs
            Set rs = Nothing

    
End Sub
Sub loadTransactionOfThisItem(item_code As String, lsv As ListView, begining_date As String, ending_date As String)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    If date_type_selection = True Then
    
'            sql = "SELECT * FROM quick_report_items WHERE transaction_date='" & (Format(activeDate, "yyyy-mm-dd")) & "' AND item_code='" & item_code & "' ORDER BY id"
            sql = "select item_code,transaction_type, " & _
                    "case " & _
                    "when transaction_type='stock_out' or transaction_type='convert_out' or transaction_type='return_stock' then item_qty_standing+item_qty " & _
                    "when transaction_type='stock_in' or transaction_type='convert_in' then item_qty_standing-item_qty " & _
                    "end as answer, " & _
                    "case " & _
                    "when transaction_type='stock_out' or transaction_type='convert_out' or transaction_type='return_stock' then'-' " & _
                    "when transaction_type='stock_in' or transaction_type='convert_in' then'+' " & _
                    "end as operation, " & _
                    "item_qty,item_qty_standing,transaction_date from quick_report_items WHERE transaction_date='" & (Format(activeDate, "yyyy-mm-dd")) & "' AND item_code='" & item_code & "' ORDER BY id"

    Else
'          sql = "SELECT * FROM quick_report_items WHERE transaction_date BETWEEN '" & (Format(begining_date, "yyyy-mm-dd")) & "'" & _
'               "AND '" & (Format(ending_date, "yyyy-mm-dd")) & "' AND item_code= '" & item_code & "' ORDER BY id"
           sql = "select item_code,transaction_type, " & _
                    "case " & _
                    "when transaction_type='stock_out' or transaction_type='convert_out' or transaction_type='return_stock' then item_qty_standing+item_qty " & _
                    "when transaction_type='stock_in' or transaction_type='convert_in' then item_qty_standing-item_qty " & _
                    "end as answer, " & _
                    "case " & _
                    "when transaction_type='stock_out' or transaction_type='convert_out' or transaction_type='return_stock' then'-' " & _
                    "when transaction_type='stock_in' or transaction_type='convert_in' then'+' " & _
                    "end as operation, " & _
                    "item_qty,item_qty_standing,transaction_date from quick_report_items WHERE transaction_date BETWEEN '" & (Format(begining_date, "yyyy-mm-dd")) & "'" & _
                    "AND '" & (Format(ending_date, "yyyy-mm-dd")) & "' AND item_code= '" & item_code & "' ORDER BY id"
End If
    
    
    Set rs = db.execute(sql)
    Dim lst As ListItem
   lsv.ListItems.Clear
    
    Do Until rs.EOF
    On Error Resume Next
    Set list = lsv.ListItems.Add(, , rs.Fields("item_code").value)

             list.SubItems(1) = rs.Fields("answer").value
             list.SubItems(2) = rs.Fields("operation").value
             list.SubItems(3) = rs.Fields("item_qty").value
             list.SubItems(4) = rs.Fields("item_qty_standing").value
             list.SubItems(5) = rs.Fields("transaction_type").value
             list.SubItems(6) = rs.Fields("transaction_date").value
                  
    rs.MoveNext
    Loop
    Set dtaQuickReport.DataSource = rs
    Set rs = Nothing
End Sub



Public Function getQuantityStandingOfThisItem(item_code) As Double
    Dim sql As String
    Dim rs As New ADODB.Recordset
        sql = "SELECT * FROM items WHERE item_code='" & item_code & "'"
    Set rs = db.execute(sql)
        getQuantityStandingOfThisItem = rs.Fields("item_qty").value
End Function

