VERSION 5.00
Begin VB.Form frmReturnQty 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Enter Return Quantity"
   ClientHeight    =   1830
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   2880
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1830
   ScaleWidth      =   2880
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtReturnQty 
      Alignment       =   2  'Center
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
      Left            =   0
      TabIndex        =   2
      Top             =   390
      Width           =   2775
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   1140
      Width           =   1185
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1380
      TabIndex        =   0
      Top             =   1140
      Width           =   1185
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Return Quantity"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   330
      TabIndex        =   3
      Top             =   60
      Width           =   2235
   End
End
Attribute VB_Name = "frmReturnQty"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim edit_sales_order As Sales
Private Sub cmdCancel_Click()
cancelreturn = True
Unload Me
End Sub

Private Sub cmdOk_Click()
cancelreturn = False
resetReturnItemsVariables
returnQty = txtReturnQty.Text
AmountToDeductPerItem = Val(frmAdjustSaleTransaction.lsvAffectedItems.SelectedItem.SubItems(7)) * Val(frmReturnQty.txtReturnQty.Text)
If frmAdjustSaleTransaction.lsvAffectedItems.SelectedItem.Text < txtReturnQty.Text Then
    MsgBox ("Return Quantity Exist the out Quantity")
Else
Unload Me
End If
End Sub

Sub resetReturnItemsVariables()
returnQty = 0
AmountToDeductPerItem = 0
End Sub

Private Sub Form_Load()
Me.Top = frmAdjustSaleTransaction.Top + 2000
Me.Left = frmAdjustSaleTransaction.Left + 2000
End Sub
