Attribute VB_Name = "Helper_Quickreports"
Dim load_customer_sales As String

    'load_customer_sales = "SELECT c.customers_name,st.sales_order_no,i.item_code,id.item_name,so.qty_out,so.amount FROM customers c left join stock_out_transaction st on c.customers_id=st.responsible_customer left join stock_out_transaction_stock_out_items stsi on st.sales_order_no=stsi.sales_order_no left join stock_out so on stsi.stockout_id=so.stockout_id left join items i on so.item_id=i.item_id left join items_description id on i.item_code=id.item_code"

Sub loadSalesOfThisCustomer(cus_id As Integer, lsv As ListView, begining_date As String, ending_date As String)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    
    If date_type_selection = True Then
    
            sql = "SELECT c.customers_name,st.sales_order_no,i.item_code,id.item_name,so.qty_out,so.amount " & _
                  " FROM customers c left join stock_out_transaction st on c.customers_id=st.responsible_customer " & _
                  " left join stock_out_transaction_stock_out_items stsi on st.sales_order_no=stsi.sales_order_no " & _
                  " left join stock_out so on stsi.stockout_id=so.stockout_id left join items i on so.item_id=i.item_id " & _
                  " left join items_description id on i.item_code=id.item_code " & _
                  " WHERE DATE_FORMAT(st.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' and c.customers_id= " & cus_id & ""
    Else
            sql = "SELECT c.customers_name,st.sales_order_no,i.item_code,id.item_name,so.qty_out,so.amount " & _
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
    
    Set list = lsv.ListItems.Add(, , rs.Fields("sales_order_no").value)
        list.SubItems(1) = rs.Fields("item_code").value
        list.SubItems(2) = rs.Fields("item_name").value
        list.SubItems(3) = rs.Fields("qty_out").value
        list.SubItems(4) = rs.Fields("amount").value
    rs.MoveNext
    Loop
    Set rs = Nothing
End Sub


