VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmStockInItem 
   BackColor       =   &H00325641&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Stock In Items"
   ClientHeight    =   4560
   ClientLeft      =   45
   ClientTop       =   675
   ClientWidth     =   8235
   Icon            =   "frmStockInItem.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4560
   ScaleWidth      =   8235
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      ForeColor       =   &H80000008&
      Height          =   4455
      Left            =   60
      ScaleHeight     =   4425
      ScaleWidth      =   8085
      TabIndex        =   0
      Top             =   60
      Width           =   8115
      Begin MSComctlLib.ListView ListView1 
         Height          =   4275
         Left            =   60
         TabIndex        =   1
         Top             =   60
         Width           =   7935
         _ExtentX        =   13996
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
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "#"
            Object.Width           =   882
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Item Code"
            Object.Width           =   8819
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   2
            SubItemIndex    =   2
            Text            =   "Qty In"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "stockin_id"
            Object.Width           =   0
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Item_id"
            Object.Width           =   0
         EndProperty
      End
   End
   Begin VB.Menu mnuItem_menu 
      Caption         =   "Items Menu"
      Begin VB.Menu mnuEdit 
         Caption         =   "Edit"
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "Delete"
      End
   End
End
Attribute VB_Name = "frmStockInItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Call loadStockInItemsToListView(activestockId, ListView1)
End Sub

Private Sub ListView1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then
PopupMenu mnuItem_menu
End If
End Sub

Private Sub mnuDelete_Click()
Dim confirm As Byte
confirm = MsgBox("are you sure you want to delete this stock in item", vbQuestion + vbYesNo)
If confirm = vbYes Then
    Call deleteStockInItem(Val(ListView1.SelectedItem.SubItems(3)), Val(ListView1.SelectedItem.SubItems(2)), Val(ListView1.SelectedItem.SubItems(4)))
    MsgBox ("Stock in items deleted")
    Call loadStockInItemsToListView(activestockId, ListView1)
End If
End Sub

Private Sub mnuEdit_Click()
Call loadStockInItemsToBeEdit(Val(ListView1.SelectedItem.SubItems(3)), frmEditStockinItem.txtItemName, frmEditStockinItem.txtItem_qty)
frmEditStockinItem.Show 1
End Sub
