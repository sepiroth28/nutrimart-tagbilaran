VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cutomer_reference"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'local variable(s) to hold property value(s)
Private mvaraddress As String 'local copy
Private mvarreference As String 'local copy
Private mvarwork As String 'local copy
Private mvarstore_name As String 'local copy
Private mvarcus_id As Integer 'local copy
Public Sub loadCustomerReference(cus_id)
    Dim sql As String
    Dim rs As New ADODB.Recordset
        sql = "SELECT * FROM cutomer_reference WHERE cus_id=" & cus_id & ""
    Set rs = db.execute(sql)
    On Error Resume Next
    With Me
            .address = rs.Fields("address").value
            .reference = rs.Fields("reference").value
            .work = rs.Fields("work").value
            .store_name = rs.Fields("store_name").value
            .cus_id = rs.Fields("cus_id").value
    End With
End Sub

Public Sub deleteCustomerReference()
    Dim sql As String
        sql = "DELETE FROM cutomer_reference WHERE cus_id=" & Me.cus_id & ""
        db.execute (sql)
End Sub

Public Sub editCustomerReference()
    Dim sql As String
        sql = "UPDATE cutomer_reference SET address='" & Me.address & "',reference='" & Me.reference & "'," & _
            "work='" & Me.work & "',store_name='" & Me.store_name & "' where cus_id=" & Me.cus_id & ""
        db.execute (sql)
End Sub

Public Sub saveCustomerReference()
    Dim sql As String
        sql = "INSERT INTO cutomer_reference VALUES('" & Me.address & "','" & Me.reference & "','" & Me.work & "'," & _
            "'" & Me.store_name & "'," & Me.cus_id & ")"
        db.execute (sql)
End Sub

Public Property Let cus_id(ByVal vData As Integer)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.cus_id = 5
    mvarcus_id = vData
End Property


Public Property Get cus_id() As Integer
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.cus_id
    cus_id = mvarcus_id
End Property



Public Property Let store_name(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.store_name = 5
    mvarstore_name = vData
End Property


Public Property Get store_name() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.store_name
    store_name = mvarstore_name
End Property



Public Property Let work(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.work = 5
    mvarwork = vData
End Property


Public Property Get work() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.work
    work = mvarwork
End Property



Public Property Let reference(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.reference = 5
    mvarreference = vData
End Property


Public Property Get reference() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.reference
    reference = mvarreference
End Property



Public Property Let address(ByVal vData As String)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.address = 5
    mvaraddress = vData
End Property


Public Property Get address() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.address
    address = mvaraddress
End Property



