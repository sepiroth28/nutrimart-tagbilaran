Attribute VB_Name = "Helper_Sales"
Public Sub loadActiveCartItems(lsv As ListView)
  Dim cart As New cart
    Dim items As New cart_items
    Dim list As ListItem
    Dim ctr As Integer
    Set cart = activeSales.items_sold
    'name,qty,price, total
    ctr = 1
    lsv.ListItems.Clear
    For Each items In cart
        Set list = lsv.ListItems.Add(, , ctr)
        list.SubItems(1) = items.Item.item_name
        list.SubItems(2) = items.qty_purchased
        list.SubItems(3) = FormatCurrency((items.item_price), 2)
        list.SubItems(4) = FormatCurrency(items.get_total_price, 2)
        list.SubItems(5) = FormatCurrency(items.discount, 2)
        list.SubItems(6) = FormatCurrency(items.tracking_price, 2)
    ctr = ctr + 1
    Next
End Sub

Public Sub updateTotalAmount()
    frmMenu.lblTotalAmount.Caption = FormatCurrency(activeSales.get_total_amount(), 2)
End Sub

Sub prepareNewTransaction()
    With frmMenu
        .picSoldTo.Visible = False
        '.picDiscount.Visible = False
        .picPayment.Visible = False
        .lsvItemsInCart.Enabled = False
        .txtItemsList.Enabled = False
        .cmdBrowseItem.Enabled = False
        .cmdNewTransaction.Visible = True
        .cmdNewAccountReceivable.Visible = True
        .lsvItemsInCart.ListItems.Clear
        .lblTotalAmount.Caption = "0.00"
        .cmdCancelTransaction.Visible = False
        .chkWalkInCustomer.Visible = False
        .chkWalkInCustomer.value = 0
        '.cmdProcess.Enabled = False
         .cmdAddDiscount.Visible = False
         .cmdAddTracking.Visible = False
         .lblDealerType.Caption = ""
         .txtCustomers.Text = ""
         .lblAgent.Caption = ""
         
    End With
    Set activeSales = Nothing
End Sub

Sub newTransaction()
    With frmMenu
        .picSoldTo.Visible = True
        '.picDiscount.Visible = True
        .picPayment.Visible = True
        .lsvItemsInCart.Enabled = True
        .lsvItemsInCart.ListItems.Clear
        .lblTotalAmount.Caption = FormatCurrency(0, 2)
        .txtItemsList.Enabled = True
        .cmdBrowseItem.Enabled = True
        .cmdNewTransaction.Visible = False
        .cmdNewAccountReceivable.Visible = False
        .cmdCancelTransaction.Visible = True
        .chkWalkInCustomer.Visible = True
        '.cmdProcess.Enabled = False
        .cmdAddDiscount.Visible = True
        .cmdAddTracking.Visible = True
    End With
End Sub

Sub checkProcessButton()
    If frmMenu.lsvItemsInCart.ListItems.Count And (frmMenu.chkWalkInCustomer Or frmMenu.txtCustomers <> "") Then
        frmMenu.cmdProcess.Enabled = True
    Else
        frmMenu.cmdProcess.Enabled = False
    End If
End Sub
Function getAllSalesByDate(delivery_date As String) As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
        "sot.`sales_order_no`, " & _
        "IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
        "a.`Name`," & _
        "sot.`discount`," & _
        "sot.`grand_total`," & _
        "sot.`net_total`," & _
        "sot.`tendered_amount`," & _
        "sot.`change`," & _
        "sot.`delivery_date`," & _
        "sot.`prepared_by`" & _
        " FROM `stock_out_transaction` sot " & _
        "LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
        "LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
        "LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
        " WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & delivery_date & "'" & _
        "ORDER BY sot.delivery_date ASC; "
'MsgBox sql
Set getAllSalesByDate = db.execute(sql)
End Function
Sub loadAllSalesToListview(lsv As ListView, today As Boolean, payment_type As Integer, Optional delivery_date As String)
   Dim list As ListItem
   Dim rs As New ADODB.Recordset
   'sales_order_no, customer_name, Name, discount, grand_total, net_total, tendered_amount, change, delivery_date
    If today Then
        If payment_type = 3 Then
            Set rs = getTodayAllSales
        ElseIf payment_type = PAYMENT_COD Then
            Set rs = getAllCODTodaySales
        ElseIf payment_type = PAYMENT_ACCOUNT_RECEIVABLE Then
            Set rs = getAllAccountReceivableTodaySales
        End If
    Else
         If payment_type = 3 Then
             Set rs = getAllSalesByDate(delivery_date)
        ElseIf payment_type = PAYMENT_COD Then
            Set rs = getAllCODSales
        ElseIf payment_type = PAYMENT_ACCOUNT_RECEIVABLE Then
            Set rs = getAllAccountReceivableSales
        End If
    End If
 lsv.ListItems.Clear
   If rs.RecordCount > 0 Then
   
    On Error Resume Next
        Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
            list.SubItems(1) = rs.Fields(1).value
            list.SubItems(2) = rs.Fields(2).value
            list.SubItems(3) = rs.Fields(3).value
            list.SubItems(4) = FormatNumber(rs.Fields(4).value, 2)
            list.SubItems(5) = FormatNumber(rs.Fields(5).value, 2)
            list.SubItems(6) = FormatNumber(rs.Fields(6).value, 2)
            list.SubItems(7) = rs.Fields(7).value
            list.SubItems(8) = rs.Fields(8).value
            list.SubItems(9) = rs.Fields(9).value
            list.SubItems(10) = rs.Fields(10).value
        rs.MoveNext
        Loop
   End If
   
   Set rs = Nothing
End Sub
Function getAllCODSales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
      " cod.`sales_order_no`," & _
      " IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
      " a.`Name`, " & _
      " sot.`discount`," & _
      " sot.`grand_total`," & _
      " sot.`net_total`," & _
      " sot.`tendered_amount`," & _
      " sot.`change`," & _
      " sot.`delivery_date`," & _
      "sot.`prepared_by`" & _
      " FROM `cod` cod " & _
      " LEFT JOIN `stock_out_transaction` sot ON sot.sales_order_no = cod.sales_order_no " & _
      " LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
      " LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
      " LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
      " ORDER BY cod.`date` ASC;"
Set getAllCODSales = db.execute(sql)
End Function

Function getAllCODTodaySales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
      " cod.`sales_order_no`," & _
      " IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
      " a.`Name`, " & _
      " sot.`discount`," & _
      " sot.`grand_total`," & _
      " sot.`net_total`," & _
      " sot.`tendered_amount`," & _
      " sot.`change`," & _
      " sot.`delivery_date`," & _
      " sot.`prepared_by`" & _
      " FROM `cod` cod " & _
      " LEFT JOIN `stock_out_transaction` sot ON sot.sales_order_no = cod.sales_order_no " & _
      " LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
      " LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
      " LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
      " WHERE DATE_FORMAT(cod.`date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "'" & _
      " ORDER BY cod.`date` ASC;"
Set getAllCODTodaySales = db.execute(sql)
End Function
Function getAllAccountReceivableSales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
      " acr.`sales_order_no`," & _
      " IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
      " a.`Name`, " & _
      " sot.`discount`," & _
      " sot.`grand_total`," & _
      " sot.`net_total`," & _
      " sot.`tendered_amount`," & _
      " sot.`change`," & _
      " sot.`delivery_date`," & _
      " sot.`prepared_by`" & _
      " FROM `account_receivable` acr " & _
      " LEFT JOIN `stock_out_transaction` sot ON sot.sales_order_no = acr.sales_order_no " & _
      " LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
      " LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
      " LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
      " ORDER BY acr.`date` ASC;"
Set getAllAccountReceivableSales = db.execute(sql)
End Function

Function getAllAccountReceivableTodaySales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
      " acr.`sales_order_no`," & _
      " IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
      " a.`Name`, " & _
      " sot.`discount`," & _
      " sot.`grand_total`," & _
      " sot.`net_total`," & _
      " sot.`tendered_amount`," & _
      " sot.`change`," & _
      " sot.`delivery_date`," & _
      " sot.`prepared_by`" & _
      " FROM `account_receivable` acr " & _
      " LEFT JOIN `stock_out_transaction` sot ON sot.sales_order_no = acr.sales_order_no " & _
      " LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
      " LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
      " LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
      " WHERE DATE_FORMAT(acr.`date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
      " ORDER BY acr.`date` ASC;"
Set getAllAccountReceivableTodaySales = db.execute(sql)
End Function
Function getAllSales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
        "sot.`sales_order_no`, " & _
        "IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
        "a.`Name`," & _
        "sot.`discount`," & _
        "sot.`grand_total`," & _
        "sot.`net_total`," & _
        "sot.`tendered_amount`," & _
        "sot.`change`," & _
        "sot.`delivery_date`," & _
        "sot.`prepared_by`" & _
        " FROM `stock_out_transaction` sot " & _
        "LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
        "LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
        "LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
        "ORDER BY sot.delivery_date ASC; "
Set getAllSales = db.execute(sql)
End Function
Function getTodayAllSales() As ADODB.Recordset
Dim sql As String
sql = "SELECT " & _
        "sot.`sales_order_no`, " & _
        "IF(c.`customers_name` IS NOT NULL,c.`customers_name`,'Walk-in customer') as customer_name," & _
        "a.`Name`," & _
        "sot.`discount`," & _
        "sot.`grand_total`," & _
        "sot.`net_total`," & _
        "sot.`tendered_amount`," & _
        "sot.`change`," & _
        "sot.`delivery_date`," & _
         "sot.`prepared_by`" & _
        " FROM `stock_out_transaction` sot " & _
        "LEFT JOIN customers c ON sot.responsible_customer = c.customers_id " & _
        "LEFT JOIN agent_customers ac ON ac.customers_id = c.customers_id " & _
        "LEFT JOIN agent a ON ac.agent_id = a.agent_id " & _
        "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
        "ORDER BY sot.delivery_date ASC; "
Set getTodayAllSales = db.execute(sql)
End Function

Function getTotalDiscountAsOfTodaySales(payment_type As Integer) As Double
    Dim sql As String
    If payment_type = 3 Then
        sql = "SELECT SUM(discount) FROM stock_out_transaction sot " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_COD Then
        sql = "SELECT SUM(discount) FROM cod c " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = c.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') ='" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_ACCOUNT_RECEIVABLE Then
        sql = "SELECT SUM(discount) FROM account_receivable acr " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = acr.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    End If
    Dim rs As New ADODB.Recordset
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getTotalDiscountAsOfTodaySales = rs.Fields(0).value
    Else
        getTotalDiscountAsOfTodaySales = FormatNumber(0, 2)
    End If
End Function
Function getGrandTotalAsOfTodaySales(payment_type As Integer) As Double
    Dim sql As String
    If payment_type = 3 Then
        sql = "SELECT SUM(grand_total) FROM stock_out_transaction sot " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_COD Then
        sql = "SELECT SUM(grand_total) FROM cod c " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = c.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_ACCOUNT_RECEIVABLE Then
        sql = "SELECT SUM(grand_total) FROM account_receivable acr " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = acr.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "'" & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    End If
     Dim rs As New ADODB.Recordset
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getGrandTotalAsOfTodaySales = rs.Fields(0).value
    Else
        getGrandTotalAsOfTodaySales = FormatNumber(0, 2)
    End If
End Function

Function getNetTotalAsOfTodaySales(payment_type As Integer) As Double
    Dim sql As String
     If payment_type = 3 Then
        sql = "SELECT SUM(net_total) FROM stock_out_transaction sot " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_COD Then
        sql = "SELECT SUM(net_total) FROM cod c " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = c.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    ElseIf payment_type = PAYMENT_ACCOUNT_RECEIVABLE Then
        sql = "SELECT SUM(net_total) FROM account_receivable acr " & _
              "INNER JOIN stock_out_transaction sot ON sot.sales_order_no = acr.sales_order_no " & _
              "WHERE DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d') = '" & (Format(activeDate, "yyyy-mm-dd")) & "' " & _
              "GROUP BY DATE_FORMAT(sot.`delivery_date`,'%Y-%m-%d')"
    End If
     Dim rs As New ADODB.Recordset
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getNetTotalAsOfTodaySales = rs.Fields(0).value
    Else
        getNetTotalAsOfTodaySales = FormatNumber(0, 2)
    End If
    
    
End Function
Function getALLCODList() As ADODB.Recordset
    Dim sql As String
    sql = "SELECT * FROM cod"
    Set getALLCODList = db.execute(sql)
End Function
Sub loadAllCODToListview(lsv As ListView)
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    Set rs = getALLCODList()
    lsv.ListItems.Clear
    If rs.RecordCount > 0 Then
        Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
            list.SubItems(1) = rs.Fields(1).value
            list.SubItems(2) = rs.Fields(2).value
            
        rs.MoveNext
        Loop
        
       
       
    End If
End Sub
Sub loadSalesOrderOfCustomerToListview(customer_id As Integer, lsv As ListView)
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    Set rs = getSalesOrderOfThisCustomer(customer_id)
    lsv.ListItems.Clear
    On Error Resume Next
    If rs.RecordCount > 0 Then
        Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
            list.SubItems(1) = FormatNumber(rs.Fields(1).value, 2)
            list.SubItems(2) = rs.Fields(2).value
            list.SubItems(3) = FormatDateTime(rs.Fields(3).value, vbGeneralDate)
            If rs.Fields(2).value = "unsettled" Then
                list.ForeColor = vbRed
                
            End If
            If rs.Fields(2).value = "fully paid" Then
                list.SubItems(4) = getPaymentDateOfThisSO(rs.Fields(0).value)
            End If
            list.SubItems(5) = rs.Fields("prepared_by").value
        rs.MoveNext
        Loop
        
        'list.SubItems(1) = FormatNumber(getTotalAmountOfAccountReceivableOfThisCustomer(customer_id), 2)
    End If
End Sub
Sub PrintsalesorderofCustomer(customer_id As Integer, total As Double)
    Dim newcus As New Customers
    newcus.load_customers (customer_id)
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    Set rs = getUnsettleSalesOrderOfthisCustomer(customer_id)
    Set dtaListOfAccountReceivable.DataSource = rs
        dtaListOfAccountReceivable.Sections(1).Controls("lblCustomerName").Caption = newcus.customers_name
        dtaListOfAccountReceivable.Sections(1).Controls("lblCustomerAdd").Caption = newcus.customers_add
        dtaListOfAccountReceivable.Sections(5).Controls("lblTotal").Caption = total
        dtaListOfAccountReceivable.Show 1
    Set rs = Nothing
End Sub

Function getSalesOrderOfThisCustomer(customer_id As Integer) As ADODB.Recordset
    Dim sql As String
    sql = "SELECT acr.sales_order_no,sot.net_total,acr.remarks,DATE_FORMAT(sot.delivery_date,'%m/%d/%Y') as delivery_date,sot.prepared_by " & _
              "  FROM `account_receivable` acr " & _
              "  LEFT JOIN `stock_out_transaction` sot " & _
              "  ON acr.sales_order_no = sot.sales_order_no " & _
              "  WHERE sot.responsible_customer = " & customer_id & " ORDER BY sot.delivery_date DESC"
    Set getSalesOrderOfThisCustomer = db.execute(sql)
    
End Function
Function getUnsettleSalesOrderOfthisCustomer(customer_id As Integer) As ADODB.Recordset
    Dim sql As String
    sql = "SELECT acr.sales_order_no,sot.net_total,acr.remarks,DATE_FORMAT(sot.delivery_date,'%m/%d/%Y') as delivery_date,sot.prepared_by " & _
              "  FROM `account_receivable` acr " & _
              "  LEFT JOIN `stock_out_transaction` sot " & _
              "  ON acr.sales_order_no = sot.sales_order_no " & _
              "  WHERE sot.responsible_customer = " & customer_id & " and acr.remarks='unsettled' ORDER BY sot.delivery_date DESC"
    Set getUnsettleSalesOrderOfthisCustomer = db.execute(sql)
End Function

Function getTotalAmountOfAccountReceivableOfThisCustomer(customer_id As Integer) As Double
    Dim rs As New ADODB.Recordset
    Dim sql As String
    sql = "SELECT SUM(net_total) as total " & _
          "  FROM `account_receivable` acr " & _
          "  LEFT JOIN `stock_out_transaction` sot " & _
          "  ON acr.sales_order_no = sot.sales_order_no " & _
          "   Where sot.responsible_customer = " & customer_id & " " & _
          "  GROUP BY responsible_customer"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getTotalAmountOfAccountReceivableOfThisCustomer = rs.Fields(0).value
    End If
End Function

Function getTotalAmountPaidOfAccountReceivableOfThisCustomer(customer_id As Integer) As Double
    Dim rs As New ADODB.Recordset
    Dim sql As String
    sql = "SELECT sum(pr.amount) as total_amount FROM `account_receivable` acr " & _
        "LEFT JOIN `stock_out_transaction` sot   ON acr.sales_order_no = sot.sales_order_no " & _
        "inner join `payment_records` pr on sot.sales_order_no=pr.sales_order_no " & _
        "Where sot.responsible_customer = " & customer_id & " GROUP BY responsible_customer"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getTotalAmountPaidOfAccountReceivableOfThisCustomer = rs.Fields(0).value
    End If
End Function

Function getReceiverRemit(sales_date As Date) As String
    Dim rs As New ADODB.Recordset
    Dim sql As String
    sql = "SELECT * FROM cod_remitted WHERE sales_date = '" & Format(sales_date, "yyyy-mm-dd") & "'"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getReceiverRemit = rs.Fields("remit_by").value
    Else
        getReceiverRemit = ""
    End If
End Function

Function getAcceptByRemit(sales_date As Date) As String
    Dim rs As New ADODB.Recordset
    Dim sql As String
    sql = "SELECT * FROM cod_remitted WHERE sales_date = '" & Format(sales_date, "yyyy-mm-dd") & "'"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        getAcceptByRemit = rs.Fields("received_by").value
    Else
        getAcceptByRemit = ""
    End If
End Function

Function checkCODIfRemitted(sales_date As Date) As Boolean
    Dim rs As New ADODB.Recordset
    Dim sql As String
    sql = "SELECT * FROM cod_remitted WHERE sales_date = '" & Format(sales_date, "yyyy-mm-dd") & "'"
    Set rs = db.execute(sql)
    If rs.RecordCount > 0 Then
        checkCODIfRemitted = True
    Else
        checkCODIfRemitted = False
    End If
End Function

Function getPaymentDateOfThisSO(so As String) As String
Dim sql As String
Dim rs As ADODB.Recordset

sql = "SELECT * FROM `payment_records` where sales_order_no = '" & so & "' ORDER BY payment_date DESC LIMIT 1"

Set rs = db.execute(sql)
If rs.RecordCount > 0 Then
    getPaymentDateOfThisSO = Format(rs.Fields("payment_date").value, "mm/dd/yyyy")
End If

Set rs = Nothing
End Function
' return stock functions
Function returnQty_to_stock(so As String, item_id As Integer) As Double
    Dim sql As String
    Dim rs As ADODB.Recordset
    sql = "SELECT s.*,soti.*,sot.sales_order_no FROM stock_out s inner join stock_out_transaction_stock_out_items soti on s.stockout_id=soti.stockout_id inner join stock_out_transaction sot on sot.sales_order_no=soti.sales_order_no where sot.sales_order_no='" & so & "' and s.item_id='" & item_id & "'"
    Set rs = db.execute(sql)
    returnQty_to_stock = rs.Fields("qty_out").value
End Function
Function getStockout_id(item_id As Integer) As Double
    Dim sql As String
    Dim rs As ADODB.Recordset
    sql = "select * from stock_out where item_id='" & item_id & "'"
    Set rs = db.execute(sql)
    getStockout_id = rs.Fields("stockout_id").value
End Function

Function addReturnStock(so As String, item_id As Integer)
    Dim return_item As New items
    return_item.load_item (item_id)
    Call returnQty_to_stock(so, item_id)
    return_item.addStock (returnQty_to_stock(so, item_id))
    Call delete_stockout_transaction_of_this_return_item(so, item_id)
    
End Function
Function addReturnStockPartial(so As String, item_id As Integer)
    Dim return_item As New items
    return_item.load_item (item_id)
    return_item.addStock (returnQty)
    Call update_stockout_transaction_of_this_return_item(so, item_id)
End Function
Function delete_stockout_transaction_of_this_return_item(so As String, item_id)
    Dim sql As String
    Dim delete_from_stockout As String
    Dim delete_from_stock_out_transaction_stock_out_items As String
    Dim getStockout_id_of_this_item As Integer
    Dim rs As ADODB.Recordset
    
    sql = "SELECT s.*,soti.*,sot.sales_order_no FROM stock_out s inner join stock_out_transaction_stock_out_items soti on s.stockout_id=soti.stockout_id inner join stock_out_transaction sot on sot.sales_order_no=soti.sales_order_no where sot.sales_order_no='" & so & "' and s.item_id='" & item_id & "'"
    Set rs = db.execute(sql)

    getStockout_id_of_this_item = rs.Fields("stockout_id").value
    delete_from_stockout = "delete from stock_out where stockout_id='" & getStockout_id_of_this_item & "'"
    db.execute (delete_from_stockout)
    delete_from_stock_out_transaction_stock_out_items = "delete from stock_out_transaction_stock_out_items where stockout_id='" & getStockout_id_of_this_item & "'"
    db.execute (delete_from_stock_out_transaction_stock_out_items)
End Function
Function update_stockout_transaction_of_this_return_item(so As String, item_id)
    Dim sql As String
    Dim update_stockout_qty As String
    Dim getStockout_id_of_this_item As Integer
    Dim gettracking As Double
    Dim getdiscount As Double
    Dim getprice As Double
    Dim getqty As Double
    Dim newqty As Double
    Dim newamount As Double
    
    
    Dim rs As ADODB.Recordset
    
    sql = "SELECT s.*,soti.*,sot.sales_order_no FROM stock_out s inner join stock_out_transaction_stock_out_items soti on s.stockout_id=soti.stockout_id inner join stock_out_transaction sot on sot.sales_order_no=soti.sales_order_no where sot.sales_order_no='" & so & "' and s.item_id='" & item_id & "'"
    Set rs = db.execute(sql)

    getStockout_id_of_this_item = rs.Fields("stockout_id").value
    getqty = rs.Fields("qty_out").value
    gettracking = rs.Fields("tracking_price").value
    getprice = rs.Fields("price").value
    getdiscount = rs.Fields("discount").value
    newqty = getqty - returnQty
    newamount = newqty * ((getprice + gettracking) - getdiscount)
    update_stockout_qty = "update stock_out set qty_out='" & newqty & "',amount='" & newamount & "' where stockout_id='" & getStockout_id_of_this_item & "'"
    db.execute (update_stockout_qty)
End Function

Function updateSONetTotal(so As String, amountToBeDeduct As Double)
    Dim sql As String
    Dim rs As ADODB.Recordset
  '  Call getNettotal(SO)
    sql = "UPDATE stock_out_transaction SET net_total= net_total - '" & amountToBeDeduct & "' ,grand_total=grand_total - '" & amountToBeDeduct & "' where sales_order_no='" & so & "'"
    db.execute sql
End Function

