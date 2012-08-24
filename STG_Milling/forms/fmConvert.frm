VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form fmConvert 
   BackColor       =   &H80000018&
   Caption         =   "Convert to Retail"
   ClientHeight    =   7725
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6795
   LinkTopic       =   "Form1"
   ScaleHeight     =   7725
   ScaleWidth      =   6795
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdConvert 
      Caption         =   "Convert"
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
      Left            =   5040
      TabIndex        =   1
      Top             =   540
      Width           =   1695
   End
   Begin VB.TextBox txtSearchItemCode 
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
      Left            =   1770
      TabIndex        =   0
      Top             =   540
      Width           =   3255
   End
   Begin MSComctlLib.ListView lsvItemList 
      Height          =   6615
      Left            =   90
      TabIndex        =   3
      Top             =   1080
      Width           =   6645
      _ExtentX        =   11721
      _ExtentY        =   11668
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
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Search Item Code:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   150
      TabIndex        =   2
      Top             =   630
      Width           =   1635
   End
End
Attribute VB_Name = "fmConvert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdConvert_Click()
parent_id = lsvItemList.SelectedItem.SubItems(1)
unit_of_measure_holder = lsvItemList.SelectedItem.SubItems(7)
item_description_holder = lsvItemList.SelectedItem.SubItems(2)
current_item_stock = lsvItemList.SelectedItem.SubItems(4)
frmConvertInput_qty.Show 1
End Sub
Private Sub Form_Load()

Call setItemsDescriptionColumns(lsvItemList)
lsvItemList.ColumnHeaders(1).width = 0
lsvItemList.ColumnHeaders(2).width = 2000
lsvItemList.ColumnHeaders(3).width = 2800
lsvItemList.ColumnHeaders(4).width = 2500
lsvItemList.ColumnHeaders(5).Alignment = lvwColumnRight
lsvItemList.ColumnHeaders(6).Alignment = lvwColumnRight
lsvItemList.ColumnHeaders(7).width = 1900
lsvItemList.ColumnHeaders(8).width = 1900
Call loadAllConvertableItemsToListview(lsvItemList, "item_code")
'Call loadAllConvertable_ItemsToListview(lsvItemList)
End Sub
Private Sub txtSearchItemCode_Change()
Call loadConvertibleSearchItemsToListview(lsvItemList, txtSearchItemCode.Text)
End Sub
