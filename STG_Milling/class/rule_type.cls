VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "rule_type"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvarruletype_id As Integer 'local copy
Private mvarrule_type_name As String 'local copy
Private mvardescription As String 'local copy
Public Function load_rule_type_id(rule_name As String) As rule_type
    Dim sql As String
    Dim rs As New ADODB.Recordset
        sql = "SELECT * FROM rule_type WHERE name= '" & rule_name & "'"
    Set rs = db.execute(sql)
 With Me
        .ruletype_id = rs.Fields("ruletype_id").value
        .rule_type_name = rs.Fields("name").value
        .description = rs.Fields("description").value
 End With
End Function

Public Sub update_rule_type()
Dim update_tbl_rule_type As String
    update_tbl_rule_type = "UPDATE rule_type " & _
    "SET ruletype_id=" & Me.ruletype_id & ", " & _
    "name='" & Me.rule_type_name & "'," & _
    "description='" & Me.description & "' WHERE ruletype_id=" & Me.ruletype_id & ""
db.execute (update_tbl_rule_type)
End Sub

Public Sub delete_rule_type()
Dim delete_from_rule_type As String
    delete_from_rule_type = "DELETE FROM rule_type WHERE ruletype_id=" & Me.ruletype_id & ""
db.execute (delete_from_rule_type)
End Sub

Public Sub save_rule_type()
Dim sql As String
Dim lasinsert_id As Integer
    sql = "INSERT INTO rule_type" & _
    " VALUES('0'," & _
    "'" & Me.rule_type_name & "'," & _
    "'" & Me.description & "')"
db.execute (sql)
'lasinsert_id = "select last_insert_id()"

End Sub

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



Public Property Let rule_type_name(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.rule_type_name = 5
    mvarrule_type_name = vData
End Property


Public Property Get rule_type_name() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.rule_type_name
    rule_type_name = mvarrule_type_name
End Property



Public Property Let ruletype_id(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ruletype_id = 5
    mvarruletype_id = vData
End Property


Public Property Get ruletype_id() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ruletype_id
    ruletype_id = mvarruletype_id
End Property

