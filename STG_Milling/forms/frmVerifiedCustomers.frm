VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmVerifiedCustomers 
   Caption         =   "Customer Verification"
   ClientHeight    =   6960
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7260
   LinkTopic       =   "Form1"
   ScaleHeight     =   6960
   ScaleWidth      =   7260
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Verifiy Selected Customers"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   525
      Left            =   4560
      TabIndex        =   2
      Top             =   6300
      Width           =   2685
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Select All"
      Height          =   285
      Left            =   90
      TabIndex        =   1
      Top             =   6390
      Width           =   1185
   End
   Begin MSComctlLib.ListView lsvCustomerslist 
      Height          =   6255
      Left            =   30
      TabIndex        =   0
      Top             =   0
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   11033
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      Checkboxes      =   -1  'True
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
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "CUSTOMER'S NAME"
         Object.Width           =   11465
      EndProperty
   End
End
Attribute VB_Name = "frmVerifiedCustomers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Check1_Click()
Dim list As ListItem

For Each list In lsvCustomerslist.ListItems
    list.Checked = Check1.value
Next
End Sub

Private Sub Command1_Click()
    Dim sql As String
    Dim list As ListItem
        For Each list In lsvCustomerslist.ListItems
            If list.Checked = True Then
                sql = "UPDATE verified_customer SET verefied=1 WHERE customers_id=" & list.Text & ""
            Else
                sql = "UPDATE verified_customer SET verefied=0 WHERE customers_id=" & list.Text & ""
            End If
            db.execute (sql)
        Next
    MsgBox ("Verification updated")
End Sub

Private Sub Form_Load()
    Call loadcustomers_to_verify(lsvCustomerslist)
End Sub
