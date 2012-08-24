VERSION 5.00
Begin VB.Form frmConvertInput_qty 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Enter Quantity"
   ClientHeight    =   2355
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   2925
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2355
   ScaleWidth      =   2925
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
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
      Left            =   1440
      TabIndex        =   3
      Top             =   1380
      Width           =   1185
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
      Left            =   180
      TabIndex        =   1
      Top             =   1380
      Width           =   1185
   End
   Begin VB.TextBox txtQty 
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
      Left            =   60
      TabIndex        =   0
      Top             =   660
      Width           =   2775
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Enter Quantity to Convert"
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
      Left            =   390
      TabIndex        =   2
      Top             =   330
      Width           =   2235
   End
End
Attribute VB_Name = "frmConvertInput_qty"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
txtQty.Text = ""
txtQty.SetFocus
End Sub

Private Sub cmdOk_Click()
Dim item_qty As Double
Call getCurrent_stock(parent_id, item_qty)
If item_qty < txtQty.Text Then
    MsgBox ("insufficient No. of Stocks")
Else
    Call convertToRetails(parent_id, txtQty)
    MsgBox (txtQty & " " & unit_of_measure_holder & " of " & item_description_holder & " converted to retail")
End If
Unload Me
End Sub

Private Sub Form_Activate()
txtQty.SetFocus
End Sub

Private Sub Form_Load()
Me.Top = fmConvert.Top + 2000
Me.Left = fmConvert.Left + 2000
End Sub
