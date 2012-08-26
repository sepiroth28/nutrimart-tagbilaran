VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmPricerule_affected 
   BackColor       =   &H00C8761C&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   7080
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   7380
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7080
   ScaleWidth      =   7380
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   705
      Left            =   60
      ScaleHeight     =   675
      ScaleWidth      =   7245
      TabIndex        =   1
      Top             =   6330
      Width           =   7275
      Begin VB.CheckBox chkSelectAll 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Select All"
         Height          =   435
         Left            =   210
         TabIndex        =   3
         Top             =   150
         Width           =   3435
      End
      Begin VB.CommandButton cmdSelect 
         Caption         =   "SELECT"
         Height          =   525
         Left            =   5250
         TabIndex        =   2
         Top             =   90
         Width           =   1875
      End
   End
   Begin MSComctlLib.ListView lsvItemList 
      Height          =   6255
      Left            =   60
      TabIndex        =   0
      Top             =   60
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
      NumItems        =   0
   End
End
Attribute VB_Name = "frmPricerule_affected"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub chkSelectAll_Click()
Dim list As ListItem

For Each list In lsvItemList.ListItems
    list.Checked = chkSelectAll.value
Next

End Sub

Private Sub cmdSelect_Click()
Dim list As ListItem
If active_affected_pricerule_list = PRICERULE_ACTIVE_ITEM Then
    Set frmPricerule.newpricerule.affected_items = New Collection
    For Each list In lsvItemList.ListItems
        If list.Checked = True Then
                frmPricerule.newpricerule.affected_items.Add list.Text
        End If
    Next
ElseIf active_affected_pricerule_list = PRICERULE_ACTIVE_CUSTOMER Then
    Set frmPricerule.newpricerule.affected_customer = New Collection
     For Each list In lsvItemList.ListItems
        If list.Checked = True Then
            frmPricerule.newpricerule.affected_customer.Add list.Text
        End If
     Next
End If
Unload Me
End Sub

Private Sub Form_Load()
Dim Item As ListItem
If active_affected_pricerule_list = PRICERULE_ACTIVE_ITEM Then
    Call setItemsDescriptionColumns(lsvItemList)
    lsvItemList.ColumnHeaders(1).width = 300
    lsvItemList.ColumnHeaders(1).Text = ""
    
    lsvItemList.ColumnHeaders(2).width = 2500
    lsvItemList.ColumnHeaders(3).width = 4000
    lsvItemList.ColumnHeaders(4).width = 0
    lsvItemList.ColumnHeaders(5).width = 0
    lsvItemList.ColumnHeaders(6).width = 0
    lsvItemList.ColumnHeaders(7).width = 0
    lsvItemList.ColumnHeaders(8).width = 0
    lsvItemList.ColumnHeaders(9).width = 0
    Call loadAllItemsToListview(lsvItemList, "item_code")
    
    
    For Each Item In lsvItemList.ListItems
        Call checkIfSelected(Item)
    Next
Else
    Call setCustomersColumns(lsvItemList)
    lsvItemList.ColumnHeaders(1).width = 300
    lsvItemList.ColumnHeaders(1).Text = ""
    
    lsvItemList.ColumnHeaders(2).width = 3000
    lsvItemList.ColumnHeaders(3).width = 5000
    lsvItemList.ColumnHeaders(4).width = 2000

    Call loadAllCustomersToListview(lsvItemList)

    For Each Item In lsvItemList.ListItems
        Call checkIfSelected(Item)
    Next

End If

End Sub

Sub checkIfSelected(list As ListItem)
If active_affected_pricerule_list = PRICERULE_ACTIVE_ITEM Then
    For Each items In frmPricerule.newpricerule.affected_items
        If items = list.Text Then
            list.Checked = True
            Exit Sub
        Else
            list.Checked = False
        End If
    Next
ElseIf active_affected_pricerule_list = PRICERULE_ACTIVE_CUSTOMER Then
    For Each items In frmPricerule.newpricerule.affected_customer
        If items = list.Text Then
            list.Checked = True
            Exit Sub
        Else
            list.Checked = False
        End If
    Next
End If
End Sub
