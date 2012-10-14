VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCustomer_price_rule 
   Caption         =   "Form1"
   ClientHeight    =   7740
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11340
   LinkTopic       =   "Form1"
   ScaleHeight     =   7740
   ScaleWidth      =   11340
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lsvPricerulelist 
      Height          =   2175
      Left            =   120
      TabIndex        =   4
      Top             =   5400
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   3836
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "PRICE RULE NAME"
         Object.Width           =   5292
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "DESCRIPTION"
         Object.Width           =   6174
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "CHARGE TYPE"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "VALUE"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton cmdViewpricerule 
      Caption         =   "View Price rule"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   5040
      TabIndex        =   3
      Top             =   420
      Width           =   1935
   End
   Begin VB.TextBox txtSearchCustomer 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   120
      TabIndex        =   0
      Top             =   420
      Width           =   4875
   End
   Begin MSComctlLib.ListView lsvCustomer 
      Height          =   4275
      Left            =   120
      TabIndex        =   1
      Top             =   900
      Width           =   11115
      _ExtentX        =   19606
      _ExtentY        =   7541
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   0
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Search Customer"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
End
Attribute VB_Name = "frmCustomer_price_rule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdViewpricerule_Click()
    Dim lst As ListItem
    Dim sql As String
    Dim rs As New ADODB.Recordset
        sql = "SELECT * FROM `customers` c inner join pricerule_customer pc on c.customers_id=pc.cutomer_id inner join price_rule p on pc.price_id=p.pricerule_id  where c.customers_id=" & lsvCustomer.SelectedItem.Text & ""
    Set rs = db.execute(sql)
    On Error Resume Next
    lsvPricerulelist.ListItems.Clear
    Do Until rs.EOF
        Set lst = lsvPricerulelist.ListItems.Add(, , rs.Fields("name").value)
            lst.SubItems(1) = rs.Fields("description").value
            lst.SubItems(2) = rs.Fields("charge_type").value
            lst.SubItems(3) = rs.Fields("value").value
            rs.MoveNext
    Loop
    Set rs = Nothing
    
End Sub

Private Sub Form_Load()
Call setCustomersColumns(lsvCustomer)
lsvCustomer.ColumnHeaders(1).width = 0
lsvCustomer.ColumnHeaders(2).width = 3000
lsvCustomer.ColumnHeaders(3).width = 5000
lsvCustomer.ColumnHeaders(4).width = 2000

Call loadAllCustomersToListview(lsvCustomer)
End Sub

Private Sub txtSearchCustomer_Change()
    Call searchCustomer(txtSearchCustomer, lsvCustomer)
End Sub
