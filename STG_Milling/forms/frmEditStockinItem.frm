VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEditStockinItem 
   Caption         =   "Items"
   ClientHeight    =   3690
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4740
   LinkTopic       =   "Form1"
   ScaleHeight     =   3690
   ScaleWidth      =   4740
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H80000018&
      Caption         =   "Items"
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
      Height          =   3765
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4845
      Begin MSComctlLib.ListView lsvItemlist 
         Height          =   1575
         Left            =   240
         TabIndex        =   3
         Top             =   1260
         Visible         =   0   'False
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   2778
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         HideColumnHeaders=   -1  'True
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
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Item_id"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "item_code"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "item_name"
            Object.Width           =   5292
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Object.Width           =   0
         EndProperty
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   2700
         TabIndex        =   7
         Top             =   2940
         Width           =   1875
      End
      Begin VB.TextBox txtItem_qty 
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
         Height          =   495
         Left            =   240
         TabIndex        =   5
         Top             =   1860
         Width           =   3675
      End
      Begin VB.TextBox txtItemName 
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
         Height          =   495
         Left            =   240
         TabIndex        =   2
         Top             =   780
         Width           =   3675
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "..."
         Height          =   495
         Left            =   3960
         TabIndex        =   1
         Top             =   780
         Width           =   615
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Quantity:"
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
         Left            =   240
         TabIndex        =   6
         Top             =   1500
         Width           =   1815
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Item Name:"
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
         Left            =   240
         TabIndex        =   4
         Top             =   420
         Width           =   1815
      End
   End
End
Attribute VB_Name = "frmEditStockinItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBrowse_Click()
Call loadAllItemToEditInThisListview(lsvItemlist)
Call toogleListView(lsvItemlist)
End Sub

Private Sub cmdSave_Click()
Call deleteStockInItem(Val(frmStockInItem.ListView1.SelectedItem.SubItems(3)), Val(frmStockInItem.ListView1.SelectedItem.SubItems(2)), Val(frmStockInItem.ListView1.SelectedItem.SubItems(4)))
Call updateStockInItemWithNewInfo(lsvItemlist.SelectedItem.Text, Val(txtItem_qty.Text))
MsgBox ("sucessfully updated stock in item")
End Sub

Private Sub Form_Load()
With Me
.Top = frmStockInItem.Top + 100
.Left = frmStockInItem.Left + 100
End With
Call loadThisItemToEditInThisListview(frmStockInItem.ListView1.SelectedItem.SubItems(1), lsvItemlist)
End Sub

Private Sub lsvItemlist_Click()
Call toogleListView(lsvItemlist)
txtItemName.Text = Replace(lsvItemlist.SelectedItem.SubItems(2), "'", "''")
End Sub
