Attribute VB_Name = "Helper_Stock_in"
Dim current_item_qty As New items

Function getStockInRecordsByDate(as_of As String) As ADODB.Recordset
    Dim sql As String
    sql = "SELECT " & _
          "  s.`stock_in_transaction_id`," & _
          "  s.`reference_no`," & _
          "  s.`stocked_in_to`, " & _
          "  m.`manufacturers_name`," & _
          "  s.`remarks`," & _
          "  s.`total_number_of_items` " & _
          "  FROM stock_in_transaction s " & _
          "  LEFT JOIN manufacturers m " & _
          "  ON s.`from_supplier` = m.`manufacturers_id` " & _
          " WHERE stock_in_date = '" & as_of & "'"
    Set getStockInRecordsByDate = db.execute(sql)
End Function
Sub loadStockInListByDate(as_of As String, lsv As ListView)
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    Set rs = getStockInRecordsByDate(as_of)
    
    lsv.ListItems.Clear
    If rs.RecordCount > 0 Then
    On Error Resume Next
      Do Until rs.EOF
        Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
        list.SubItems(1) = rs.Fields(1).value
        list.SubItems(2) = rs.Fields(2).value
        list.SubItems(3) = rs.Fields(3).value
        list.SubItems(4) = rs.Fields(4).value
         
      rs.MoveNext
      Loop
    End If
End Sub

Sub loadAlStockInList(lsv As ListView)
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    Set rs = getAllStockInRecords()
    
    lsv.ListItems.Clear
    If rs.RecordCount > 0 Then
    On Error Resume Next
      Do Until rs.EOF
        Set list = lsv.ListItems.Add(, , rs.Fields(0).value)
        list.SubItems(1) = rs.Fields(1).value
        list.SubItems(2) = rs.Fields(2).value
        list.SubItems(3) = rs.Fields(3).value
        list.SubItems(4) = rs.Fields(4).value
        
      rs.MoveNext
      Loop
    End If
End Sub

Function getAllStockInRecords() As ADODB.Recordset
    Dim sql As String
    sql = "SELECT " & _
          "  s.`stock_in_transaction_id`," & _
          "  s.`reference_no`," & _
          "  s.`stocked_in_to`, " & _
          "  m.`manufacturers_name`," & _
          "  s.`remarks`," & _
          "  s.`total_number_of_items` " & _
          "  FROM stock_in_transaction s " & _
          "  LEFT JOIN manufacturers m " & _
          "  ON s.`from_supplier` = m.`manufacturers_id` "
    Set getAllStockInRecords = db.execute(sql)
End Function
Sub loadStockInItemsToListView(stock_in_no As Integer, lsv As ListView)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    Dim list As ListItem
    sql = "SELECT i.item_id,i.item_code,si.stockin_id,si.qty_in FROM stock_in_transaction_to_stock_in_items s " & _
          "  LEFT JOIN stock_in si " & _
          "  ON s.stock_id = si.stockin_id " & _
          "  LEFT JOIN items i " & _
          "  ON si.item_id = i.item_id " & _
          "  Where s.stock_in_transaction_id = " & stock_in_no
    Set rs = db.execute(sql)
    
    lsv.ListItems.Clear
    If rs.RecordCount > 0 Then
    On Error Resume Next
    x = 1
       Do Until rs.EOF
            Set list = lsv.ListItems.Add(, , x)
            list.SubItems(1) = rs.Fields(1).value
            list.SubItems(2) = rs.Fields(3).value
            list.SubItems(3) = rs.Fields("stockin_id").value
            list.SubItems(4) = rs.Fields("item_id").value
       x = x + 1
       rs.MoveNext
       Loop
    End If
End Sub

Sub loadStockInItemsToBeEdit(stock_in_id As Integer, stockin_item_name As TextBox, stockin_item_qty As TextBox)
    Dim sql As String
    Dim rs As New ADODB.Recordset
    sql = "select si.*,i.item_id,i.item_code,i.item_qty,id.item_name from " & _
          "stock_in si left join items i on si.item_id=i.item_id " & _
          "left join items_description id on i.item_code=id.item_code " & _
          "where si.stockin_id=" & stock_in_id & ""
    Set rs = db.execute(sql)
    
    stockin_item_name = rs.Fields("item_name").value
    stockin_item_qty = rs.Fields("qty_in").value
    
End Sub

Sub deleteStockInItem(stock_in_id As Integer, stock_in_qty As Double, item_id As Integer)
current_item_qty.load_item (item_id)
    Dim sql As String
        sql = "delete from stock_in where stockin_id=" & stock_in_id & ""
        db.execute (sql)
        sql = "delete from stock_in_transaction_to_stock_in_items where stock_id=" & stock_in_id & ""
        db.execute (sql)
    Dim update_tbl_items As String
        update_tbl_items = "UPDATE items set item_qty=item_qty-" & stock_in_qty & " where item_id=" & current_item_qty.item_id & ""
        db.execute (update_tbl_items)
End Sub

Sub updateStockInItemWithNewInfo(item_id As Integer, item_to_add As Double)
    Dim newstockin As New StockIn
    Dim insertIntostock_in_transaction_to_stock_in_items As String
    Dim update_tbl_items As String
    
    'insert into tbl stock in
      With newstockin
        .items.item_id = Val(item_id)
        .QtyToBeAdd = Val(item_to_add)
        .insert
      End With
     'insert into tbl stock_in_transaction_to_stock_in_items
    insertIntostock_in_transaction_to_stock_in_items = "INSERT INTO stock_in_transaction_to_stock_in_items " & _
                                                     " VALUES(" & activestockId & "," & newstockin.get_last_id & ")"
        db.execute (insertIntostock_in_transaction_to_stock_in_items)
    
    'update into tbl items
        update_tbl_items = "UPDATE items set item_qty=item_qty + " & newstockin.QtyToBeAdd & " where item_id=" & item_id & ""
        db.execute (update_tbl_items)
    
End Sub
