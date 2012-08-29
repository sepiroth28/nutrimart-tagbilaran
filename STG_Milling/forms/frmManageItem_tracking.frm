VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Begin VB.Form frmManageItem_tracking 
   BackColor       =   &H00C8761C&
   Caption         =   "Manage Item Tracking"
   ClientHeight    =   7635
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   ScaleHeight     =   7635
   ScaleWidth      =   7320
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   0
      ScaleHeight     =   585
      ScaleWidth      =   7245
      TabIndex        =   4
      Top             =   0
      Width           =   7275
      Begin VB.TextBox txtSearch 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   465
         Left            =   1800
         TabIndex        =   6
         Top             =   60
         Width           =   5415
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Search Item Code:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   150
         Width           =   1725
      End
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   705
      Left            =   0
      ScaleHeight     =   675
      ScaleWidth      =   7245
      TabIndex        =   1
      Top             =   6870
      Width           =   7275
      Begin VB.CommandButton Command1 
         Caption         =   "SELECT"
         Height          =   525
         Left            =   5250
         TabIndex        =   3
         Top             =   90
         Width           =   1875
      End
      Begin VB.CheckBox Check1 
         BackColor       =   &H00E0E0E0&
         Caption         =   "Select All"
         Height          =   435
         Left            =   210
         TabIndex        =   2
         Top             =   150
         Width           =   3435
      End
   End
   Begin MSComctlLib.ListView lsvItemList 
      Height          =   6255
      Left            =   0
      TabIndex        =   0
      Top             =   630
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
Attribute VB_Name = "frmManageItem_tracking"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Dim Item As ListItem

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

End Sub
