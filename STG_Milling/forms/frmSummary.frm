VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSummary 
   Appearance      =   0  'Flat
   BackColor       =   &H00C8761C&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Summary"
   ClientHeight    =   8775
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   12795
   Icon            =   "frmSummary.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8775
   ScaleWidth      =   12795
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtRemarkshere 
      Alignment       =   1  'Right Justify
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4350
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   17
      Top             =   7590
      Width           =   4215
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   8655
      Left            =   60
      ScaleHeight     =   8625
      ScaleWidth      =   12645
      TabIndex        =   1
      Top             =   60
      Width           =   12675
      Begin VB.Frame Frame1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         Caption         =   "SHIPPING METHOD"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   1755
         Left            =   180
         TabIndex        =   25
         Top             =   6750
         Width           =   3975
         Begin VB.OptionButton optPickUp 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "PICKUP ON STORE"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   405
            Left            =   150
            TabIndex        =   27
            Top             =   840
            Width           =   3495
         End
         Begin VB.OptionButton optShippingCharge 
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            Caption         =   "DELIVERY                                         ( Tracking charge base on destination )"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000000C0&
            Height          =   405
            Left            =   150
            TabIndex        =   26
            Top             =   360
            Value           =   -1  'True
            Width           =   3735
         End
      End
      Begin VB.CommandButton cmdRemoveSelectedRule 
         Caption         =   "Remove selected rule"
         Enabled         =   0   'False
         Height          =   345
         Left            =   2370
         TabIndex        =   24
         Top             =   4980
         Width           =   2145
      End
      Begin VB.CommandButton cmdApplySelectedRule 
         Caption         =   "Apply selected rule"
         Height          =   345
         Left            =   120
         TabIndex        =   23
         Top             =   4980
         Width           =   2145
      End
      Begin VB.CommandButton cmdDone 
         Caption         =   "DONE"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1005
         Left            =   8550
         TabIndex        =   9
         Top             =   7500
         Width           =   3975
      End
      Begin VB.TextBox txtTenderedAmount 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   9570
         TabIndex        =   0
         Top             =   5880
         Width           =   2955
      End
      Begin MSComctlLib.ListView lsvItems 
         Height          =   2805
         Left            =   120
         TabIndex        =   10
         Top             =   780
         Width           =   12435
         _ExtentX        =   21934
         _ExtentY        =   4948
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483624
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "#"
            Object.Width           =   882
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Item Name"
            Object.Width           =   6174
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Qty"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   3
            Text            =   "Unit Price"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   4
            Text            =   "Amount"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "Discount"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Text            =   "Tracking price"
            Object.Width           =   2540
         EndProperty
      End
      Begin MSComctlLib.ListView lsvApplyRule 
         Height          =   945
         Left            =   150
         TabIndex        =   19
         Top             =   3960
         Width           =   5115
         _ExtentX        =   9022
         _ExtentY        =   1667
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         HideColumnHeaders=   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483624
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "id"
            Object.Width           =   529
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "rule_type"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "name"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "description"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "charge_type"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "value"
            Object.Width           =   882
         EndProperty
      End
      Begin MSComctlLib.ListView lsvAppliedRule 
         Height          =   945
         Left            =   150
         TabIndex        =   22
         Top             =   5730
         Width           =   5115
         _ExtentX        =   9022
         _ExtentY        =   1667
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         HideColumnHeaders=   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483624
         Appearance      =   0
         Enabled         =   0   'False
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   6
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "id"
            Object.Width           =   529
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "rule_type"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "name"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "description"
            Object.Width           =   4410
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "charge_type"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "value"
            Object.Width           =   882
         EndProperty
      End
      Begin VB.Label Label10 
         BackStyle       =   0  'Transparent
         Caption         =   "AUTO APPLIED PRICE RULE"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   225
         Left            =   150
         TabIndex        =   21
         Top             =   5490
         Width           =   3885
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00C0C0C0&
         X1              =   150
         X2              =   5100
         Y1              =   5400
         Y2              =   5400
      End
      Begin VB.Label Label9 
         BackStyle       =   0  'Transparent
         Caption         =   "APPLY SELECTED PRICE RULE"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   225
         Left            =   150
         TabIndex        =   20
         Top             =   3750
         Width           =   3885
      End
      Begin VB.Label Label8 
         BackStyle       =   0  'Transparent
         Caption         =   "Remarks:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Left            =   4260
         TabIndex        =   18
         Top             =   7260
         Width           =   1125
      End
      Begin VB.Label lblTrackingPrice 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   8490
         TabIndex        =   16
         Top             =   4800
         Width           =   4035
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Tracking price total : "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5550
         TabIndex        =   15
         Top             =   4800
         Width           =   3675
      End
      Begin VB.Label lblReferenceNo 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4980
         TabIndex        =   14
         Top             =   180
         Width           =   3675
      End
      Begin VB.Label Label6 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "NET TOTAL : "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5550
         TabIndex        =   13
         Top             =   5340
         Width           =   3675
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "DISCOUNT TOTAL : "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5550
         TabIndex        =   12
         Top             =   4320
         Width           =   3675
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "GRAND TOTAL : "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   13.5
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5550
         TabIndex        =   11
         Top             =   3840
         Width           =   3675
      End
      Begin VB.Label lblChange 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   20.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00325641&
         Height          =   495
         Left            =   8850
         TabIndex        =   8
         Top             =   6780
         Width           =   3675
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "CHANGE :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   5490
         TabIndex        =   7
         Top             =   6840
         Width           =   3675
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "TENDERED AMOUNT : "
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C8761C&
         Height          =   495
         Left            =   5040
         TabIndex        =   6
         Top             =   6000
         Width           =   4215
      End
      Begin VB.Label lblNetTotal 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   8490
         TabIndex        =   5
         Top             =   5340
         Width           =   4035
      End
      Begin VB.Label lblDiscount 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   495
         Left            =   8490
         TabIndex        =   4
         Top             =   4260
         Width           =   4035
      End
      Begin VB.Label lblGrandTotal 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "0.00"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   8490
         TabIndex        =   3
         Top             =   3720
         Width           =   4035
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00C0C0C0&
         X1              =   120
         X2              =   12450
         Y1              =   3660
         Y2              =   3660
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00C0C0C0&
         X1              =   120
         X2              =   12480
         Y1              =   660
         Y2              =   660
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "SUMMARY"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   120
         TabIndex        =   2
         Top             =   180
         Width           =   3675
      End
   End
End
Attribute VB_Name = "frmSummary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public done As Boolean
Public tenderedAmount As Double

Private Sub cmdApplySelectedRule_Click()
Dim addDiscount As Double
Dim items As cart_items
Dim list As ListItem
Dim getItemId As Integer
For Each list In lsvApplyRule.ListItems
    If list.Checked = True Then
        addDiscount = Val(list.SubItems(5))
        For Each items In activeSales.items_sold
            'to do create a function that checks if items is include in pricerule
                'If isItemsHasPriceRule("" & items.Item.item_id) Then
            If check_exist_item_in_pricerule(items.Item.item_id, lsvApplyRule.SelectedItem.Text) Then
                items.discount = items.discount + addDiscount
                Call prepareSalesSummary
                cmdApplySelectedRule.Enabled = False
                cmdRemoveSelectedRule.Enabled = True
            End If
        Next
    End If
Next
   



End Sub

Private Sub cmdDone_Click()
If done Then
    Dim cart As New cart
    Dim items As New cart_items
    Dim list As ListItem
    Dim ctr As Integer
    Set cart = activeSales.items_sold
    Dim walk_in_id As Integer
    'name,qty,price, total
    
   
    For Each items In cart
       With items
            .Item.stockOut (.qty_purchased)
       End With
    Next
    activeSales.tendered_amount = Val(txtTenderedAmount.Text)
    activeSales.change = activeSales.tendered_amount - activeSales.get_total_amount
    If activeSales.isSoldToWalkIn Then
        walk_in_id = activeSales.sold_to.insert
        Set activeSales.sold_to = New Customers
        activeSales.sold_to.load_customers (walk_in_id)
    End If
    activeSales.remarkshere = txtRemarkshere.Text
    activeSales.prepared_by = activeUser.username
    activeSales.save_sales
    'activeSales.updateReferenceNo
    
    'discount details
    Call addUserAppliedPriceRules
    activeSales.printDeliveryReceipt
    Call prepareNewTransaction
    Unload Me
End If
End Sub
Sub addUserAppliedPriceRules()
Dim list As ListItem
Dim desc As String
Set activeSales.userAppliedRule = New Collection

For Each list In lsvApplyRule.ListItems
    If list.Checked = True Then
        desc = "Discount details" & vbCrLf
        desc = desc & "  " & list.SubItems(2) & " - " & list.SubItems(3) & vbCrLf
    End If
Next

For Each list In lsvAppliedRule.ListItems
    If list.Checked = True Then
        
        desc = desc & "  " & list.SubItems(2) & " - " & list.SubItems(3) & vbCrLf

    End If
Next
activeSales.userAppliedRule.Add desc

End Sub

Function check_exist_item_in_pricerule(item_id As Integer, PriceruleId As Integer) As Boolean
    Dim sql As String
    Dim rs As ADODB.Recordset
    sql = "select * from pricerule_product where item_code='" & item_id & "' and price_id='" & PriceruleId & "'"
    Set rs = db.execute(sql)
    If rs.RecordCount Then
        check_exist_item_in_pricerule = True
    Else
        check_exist_item_in_pricerule = False
    End If
End Function

Private Sub cmdRemoveSelectedRule_Click()
Dim addDiscount As Double
Dim items As cart_items
Dim list As ListItem
Dim getItemId As Integer
For Each list In lsvApplyRule.ListItems
    If list.Checked = True Then
        addDiscount = Val(list.SubItems(5))
        list.Checked = False
        For Each items In activeSales.items_sold
            If check_exist_item_in_pricerule(items.Item.item_id, lsvApplyRule.SelectedItem.Text) Then
            'If getItemId > 0 Then
                items.discount = items.discount - addDiscount
                Call prepareSalesSummary
                cmdApplySelectedRule.Enabled = True
                cmdRemoveSelectedRule.Enabled = False
            End If
        Next
    End If
Next
End Sub

Private Sub Form_Load()
'this apply the auto apply price rule
    Call getAndApplyActiveAutoPriceRule
    
    Call prepareSalesSummary
End Sub

Sub prepareSalesSummary()
    done = False
    tenderedAmount = 0
    lblReferenceNo.Caption = activeSales.transaction_id
    
    'load applied rule to listview
    If activeSales.appliedRule.Count Then
        For Each r In activeSales.appliedRule
          If Not isRuleDisplayOnAutoApplyAlready(Val(r)) Then
            Dim rule As New price_rule
            Dim list As ListItem
            rule.load_price_rule (Val(r))
            
            If rule.auto_apply Then
                Set list = lsvAppliedRule.ListItems.Add(, , rule.price_id)
                list.SubItems(1) = rule.rule_type_id
                list.SubItems(2) = rule.rule_name
                list.SubItems(3) = rule.description
                list.SubItems(4) = rule.charge_type
                list.SubItems(5) = rule.value
                list.Checked = True
            Else
                If Not isRuleDisplayOnManualAlready(Val(r)) Then
                    Set list = lsvApplyRule.ListItems.Add(, , rule.price_id)
                    list.SubItems(1) = rule.rule_type_id
                    list.SubItems(2) = rule.rule_name
                    list.SubItems(3) = rule.description
                    list.SubItems(4) = rule.charge_type
                    list.SubItems(5) = rule.value
                    'list.Checked = True
                End If
            End If
            
            
           End If
        Next
    End If
    
    Call loadActiveCartItems(lsvItems)
    lblGrandTotal.Caption = FormatCurrency(activeSales.get_total_amount + activeSales.get_discount_total, 2)
    
    If activeSales.hasDiscount Then
        lblNetTotal.Caption = FormatCurrency(activeSales.get_total_amount, 2)
    Else
        lblDiscount.Caption = FormatCurrency(activeSales.get_discount_total, 2)
        lblTrackingPrice.Caption = FormatCurrency(activeSales.get_tracking_total, 2)
        lblNetTotal.Caption = FormatCurrency(activeSales.get_total_amount, 2)
    End If
    
    If activeSales.payment_type = PAYMENT_COD Then
        txtTenderedAmount.Enabled = True
    Else
        done = True
        txtTenderedAmount.Enabled = False
    End If
End Sub

Function isRuleDisplayOnAutoApplyAlready(id As Integer) As Boolean
    isRuleDisplayOnAutoApplyAlready = False
    For Each items In lsvAppliedRule.ListItems
        If items.Text = id Then
            isRuleDisplayOnAutoApplyAlready = True
            Exit Function
        End If
    Next
End Function
Function isRuleDisplayOnManualAlready(id As Integer) As Boolean
    isRuleDisplayOnManualAlready = False
    For Each items In lsvApplyRule.ListItems
        If items.Text = id Then
            isRuleDisplayOnManualAlready = True
            Exit Function
        End If
    Next
End Function

Private Sub optPickUp_Click()

Dim items As cart_items
Dim list As ListItem

    For Each items In activeSales.items_sold
            items.tracking_price = 0
            Call prepareSalesSummary
    Next
    Call prepareSalesSummary
End Sub

Private Sub optShippingCharge_Click()
Dim items As cart_items
Dim list As ListItem

    For Each items In activeSales.items_sold
       If items.Item.item_with_tracking = 1 And items.Item.item_with_half_tracking = 0 Then
           items.tracking_price = getTrackingPriceOfCurrentCustomer(activeSales.sold_to.customers_id)
       ElseIf items.Item.item_with_tracking = 1 And items.Item.item_with_half_tracking = 1 Then
           items.tracking_price = getTrackingPriceOfCurrentCustomer(activeSales.sold_to.customers_id) / 2
       Else
           items.tracking_price = 0
       End If
    Next
Call prepareSalesSummary
End Sub

Private Sub txtTenderedAmount_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
tenderedAmount = Val(txtTenderedAmount.Text)
    If activeSales.payment_type = PAYMENT_COD Then
        If Val(tenderedAmount) >= Val(activeSales.get_total_amount) Then
            Dim change As Double
            change = Val(tenderedAmount) - Val(activeSales.get_total_amount())
            lblChange.Caption = FormatCurrency(change, 2)
            done = True
            txtTenderedAmount.BackColor = &HFFFFFF
            cmdDone.SetFocus
        Else
            txtTenderedAmount.BackColor = &H80FF&
        End If
    End If
End If
End Sub
