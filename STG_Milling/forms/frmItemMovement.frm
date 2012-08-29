VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmItemMovement 
   Appearance      =   0  'Flat
   BackColor       =   &H80000018&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Item Movement"
   ClientHeight    =   7950
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   11355
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7950
   ScaleWidth      =   11355
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search"
      Height          =   405
      Left            =   9480
      TabIndex        =   3
      Top             =   60
      Width           =   1815
   End
   Begin VB.CommandButton cmdCalendar 
      Caption         =   "..."
      Height          =   375
      Left            =   8790
      TabIndex        =   2
      Top             =   90
      Width           =   615
   End
   Begin VB.TextBox txtAsOf 
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
      Height          =   375
      Left            =   4950
      TabIndex        =   1
      Top             =   90
      Width           =   3765
   End
   Begin MSComctlLib.ListView lsvItemMovementList 
      Height          =   7455
      Left            =   0
      TabIndex        =   0
      Top             =   480
      Width           =   11325
      _ExtentX        =   19976
      _ExtentY        =   13150
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
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "SO"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Customer Name"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   2
         Text            =   "Price"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   3
         Text            =   "Qty out"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   4
         Text            =   "Tracking price"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   5
         Text            =   "Grand Total"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Alignment       =   1
         SubItemIndex    =   6
         Text            =   "Net Total"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmItemMovement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public item_id_movement As Integer

Private Sub cmdCalendar_Click()
Set activeDateTextbox = txtAsOf
frmCalendar.Show 1
End Sub

Private Sub cmdSearch_Click()
Dim d As Date

d = activeDate

Call loadItemMovementList(item_id_movement, "'" & Format(d, "yyyy-mm-dd") & "'", lsvItemMovementList)
Call getMovementTotalsOfThisItem(item_id_movement, "'" & Format(d, "yyyy-mm-dd") & "'", lsvItemMovementList)

End Sub

Private Sub Form_Load()

Call loadItemMovementList(item_id_movement, "CURDATE()", lsvItemMovementList)
Call getMovementTotalsOfThisItem(item_id_movement, "CURDATE()", lsvItemMovementList)

End Sub
