VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "price_rule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarprice_id As Integer 'local copy
Private mvarrule_type_id As Integer 'local copy
Private mvarrule_name As String 'local copy
Private mvardescription As String 'local copy
Private mvarcharge_type As String 'local copy
Private mvarvalue As Double 'local copy
Private mvarcreated_at As String 'local copy
Private mvaruse_coupon_code As Boolean 'local copy
Private mvarvalid_until As String 'local copy
Private mvarnumber_of_use As Integer 'local copy
Private mvaractive As Boolean 'local copy
Public Sub enable_price_rule()
End Sub

Public Sub load_price_rule(price_rule_id As Integer)
Dim sql As String
Dim rs As ADODB.Recordset

sql = "SELECT * FROM price_rule WHERE price_id=" & price_rule_id
Set rs = db.execute(sql)
With Me
    .price_id = rs.Fields("price_id").value
    .rule_type_id = rs.Fields("rule_type_id").value
    .rule_name = rs.Fields("name").value
    .description = rs.Fields("description").value
    .charge_type = rs.Fields("charge_type").value
    .value = rs.Fields("value").value
    .created_at = rs.Fields("created_at").value
    .use_coupon_code = rs.Fields("use_coupon_code").value
    .valid_until = rs.Fields("valid_until").value
    .number_of_use = rs.Fields("number_of_use").value
    .active = rs.Fields("active").value
End With
Set rs = Nothing
End Sub

Public Sub update_price_rule()
Dim update_tblprice_rule As String
 update_tblprice_rule = "UPDATE price_rule " & _
 "SET price_id=" & Me.price_id & ", " & _
 "rule_type_id=" & Me.rule_type_id & "," & _
 "name ='" & Me.rule_name & "'," & _
 "description= '" & Me.description & "'," & _
 "charge_type='" & Me.charge_type & "'," & _
 "value=" & Me.value & "," & _
 "created_at='" & Me.created_at & "'," & _
 "use_coupon_code='" & Me.use_coupon_code & "'," & _
 "valid_until='" & Me.valid_until & "'," & _
 "number_of_use=" & Me.number_of_use & "," & _
 "active= " & Me.active & " where price_id=" & Me.price_id & ""
 
 db.execute (update_tblprice_rule)

End Sub

Public Sub delete_price_rule()
Dim delete_from_tbl_price_rule As String
    delete_from_tbl_price_rule = "DELETE FROM price_rule where price_id=" & Me.price_id & ""
    db.execute (delete_from_tbl_price_rule)
End Sub

Public Sub save_price_rule()
Dim sql As String
Dim lastInsertId As Integer
sql = "INSERT INTO price_rule " & _
" VALUES(NULL," & _
"" & Me.rule_type_id & "," & _
"'" & Me.rule_name & "'," & _
"'" & Me.description & "', " & _
"'" & Me.charge_type & "', " & _
"" & Me.value & "," & _
" CURDATE()," & _
"'" & Me.use_coupon_code & "'," & _
"'" & Me.valid_until & "'," & _
"" & Me.number_of_use & "," & _
"" & Me.active & ")"
db.execute (sql)

'lastInsertId = "select last_insert_id()"
End Sub

Public Property Let active(ByVal vData As Boolean)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.active = 5
    mvaractive = vData
End Property


Public Property Get active() As Boolean
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.active
    active = mvaractive
End Property



Public Property Let number_of_use(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.number_of_use = 5
    mvarnumber_of_use = vData
End Property


Public Property Get number_of_use() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.number_of_use
    number_of_use = mvarnumber_of_use
End Property



Public Property Let valid_until(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.valid_until = 5
    mvarvalid_until = vData
End Property


Public Property Get valid_until() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.valid_until
    valid_until = mvarvalid_until
End Property



Public Property Let use_coupon_code(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.use_coupon_code = 5
    mvaruse_coupon_code = vData
End Property


Public Property Get use_coupon_code() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.use_coupon_code
    use_coupon_code = mvaruse_coupon_code
End Property



Public Property Let created_at(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.created_at = 5
    mvarcreated_at = vData
End Property


Public Property Get created_at() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.created_at
    created_at = mvarcreated_at
End Property



Public Property Let value(ByVal vData As Double)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.value = 5
    mvarvalue = vData
End Property


Public Property Get value() As Double
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.value
    value = mvarvalue
End Property



Public Property Let charge_type(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.charge_type = 5
    mvarcharge_type = vData
End Property


Public Property Get charge_type() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.charge_type
    charge_type = mvarcharge_type
End Property

Public Property Let description(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.description = 5
    mvardescription = vData
End Property


Public Property Get description() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.description
    description = mvardescription
End Property

Public Property Let rule_name(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.rule_name = 5
    mvarrule_name = vData
End Property

Public Property Get rule_name() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.rule_name
    rule_name = mvarrule_name
End Property



Public Property Let rule_type_id(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.rule_type_id = 5
    mvarrule_type_id = vData
End Property


Public Property Get rule_type_id() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.rule_type_id
    rule_type_id = mvarrule_type_id
End Property



Public Property Let price_id(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.price_id = 5
    mvarprice_id = vData
End Property


Public Property Get price_id() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.price_id
    price_id = mvarprice_id
End Property

Private Sub Class_Initialize()
Me.use_coupon_code = 0
Me.valid_until = 0
Me.number_of_use = 0
End Sub