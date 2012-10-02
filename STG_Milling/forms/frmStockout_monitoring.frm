VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmStockout_monitoring 
   Caption         =   "Form1"
   ClientHeight    =   7800
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   10710
   LinkTopic       =   "Form1"
   ScaleHeight     =   7800
   ScaleWidth      =   10710
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H80000018&
      Caption         =   "STOCKOUT MONITORING"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   7725
      Left            =   30
      TabIndex        =   0
      Top             =   30
      Width           =   10635
      Begin VB.CommandButton cmdDone 
         Caption         =   "PRINT"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   7590
         TabIndex        =   8
         Top             =   6750
         Width           =   2625
      End
      Begin MSComctlLib.ListView lsvTransactionlist 
         Height          =   4515
         Left            =   510
         TabIndex        =   5
         Top             =   2190
         Width           =   9765
         _ExtentX        =   17224
         _ExtentY        =   7964
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
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
            Text            =   "SALES ORDER NO."
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "REMARKS"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "AMOUNT"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "DATE"
            Object.Width           =   4762
         EndProperty
      End
      Begin VB.ComboBox cboTransaction_type 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   420
         ItemData        =   "frmStockout_monitoring.frx":0000
         Left            =   6360
         List            =   "frmStockout_monitoring.frx":000A
         TabIndex        =   4
         Text            =   "Account Receivable"
         Top             =   930
         Width           =   3855
      End
      Begin VB.TextBox txtCustomername 
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
         Height          =   465
         Left            =   480
         TabIndex        =   2
         Top             =   900
         Width           =   5715
      End
      Begin VB.Label lbltotalnooftransaction 
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   510
         TabIndex        =   7
         Top             =   6840
         Width           =   5805
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "TRANSACTION LIST"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   540
         TabIndex        =   6
         Top             =   1920
         Width           =   3315
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "SELECT TRANSACTION TYPE:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   6390
         TabIndex        =   3
         Top             =   660
         Width           =   3315
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "CUSTOMER NAME:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   480
         TabIndex        =   1
         Top             =   630
         Width           =   2235
      End
   End
End
Attribute VB_Name = "frmStockout_monitoring"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cboTransaction_type_Click()
     Call stockoutMonitoring(customer_id_monitored, cboTransaction_type)
End Sub

Private Sub Form_Load()
    Call stockoutMonitoring(customer_id_monitored, cboTransaction_type)

End Sub

Sub stockoutMonitoring(customer_id As Integer, transaction_type As String)
Dim sql As String
Dim rs As New ADODB.Recordset
Dim lst As ListItem

If transaction_type = "Account Receivable" Then

        sql = "SELECT * FROM `account_receivable` acr inner join stock_out_transaction sot " & _
            "on acr.sales_order_no=sot.sales_order_no where sot.responsible_customer=" & customer_id & " " & _
            "order by sot.delivery_date"
        Set rs = db.execute(sql)
        On Error Resume Next
        lsvTransactionlist.ListItems.Clear
        Do Until rs.EOF
        
        Set lst = lsvTransactionlist.ListItems.Add(, , rs.Fields("sales_order_no").value)
            lst.SubItems(1) = rs.Fields("remarks").value
            lst.SubItems(2) = rs.Fields("net_total").value
            lst.SubItems(3) = rs.Fields("date").value
            If rs.Fields("remarks").value = "unsettled" Then
                lst.ForeColor = vbRed
            End If
        rs.MoveNext
        Loop
        Set rs = Nothing
Else
        sql = "SELECT * FROM `cod` c inner join stock_out_transaction sot " & _
                "on c.sales_order_no=sot.sales_order_no where sot.responsible_customer=" & customer_id & " " & _
                "order by sot.delivery_date"
        Set rs = db.execute(sql)
        On Error Resume Next
        lsvTransactionlist.ListItems.Clear
        Do Until rs.EOF
        
        Set lst = lsvTransactionlist.ListItems.Add(, , rs.Fields("sales_order_no").value)
            lst.SubItems(1) = rs.Fields("remarks").value
            lst.SubItems(2) = rs.Fields("net_total").value
            lst.SubItems(3) = rs.Fields("date").value
        rs.MoveNext
        Loop
        Set rs = Nothing
End If
    lbltotalnooftransaction.Caption = "Total No. of Transaction: " & lsvTransactionlist.ListItems.Count
End Sub
