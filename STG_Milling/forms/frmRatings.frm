VERSION 5.00
Begin VB.Form frmRatings 
   BackColor       =   &H00C0FFFF&
   Caption         =   "Ratings"
   ClientHeight    =   2475
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6000
   ForeColor       =   &H0000FFFF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   2475
   ScaleWidth      =   6000
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdRating 
      BackColor       =   &H000080FF&
      Caption         =   "RATE CUSTOMER"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1350
      Width           =   1695
   End
   Begin VB.TextBox txtRating 
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
      Left            =   360
      TabIndex        =   0
      Top             =   1380
      Width           =   1515
   End
   Begin VB.Line Line1 
      X1              =   360
      X2              =   3630
      Y1              =   630
      Y2              =   630
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "RATINGS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   360
      TabIndex        =   3
      Top             =   330
      Width           =   1245
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "(Rate from 0-5)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1650
      TabIndex        =   2
      Top             =   360
      Width           =   1305
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Rate Customer: "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   360
      TabIndex        =   1
      Top             =   960
      Width           =   5445
   End
End
Attribute VB_Name = "frmRatings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdRating_Click()
    If Val(txtRating.Text) < 0 Or Val(txtRating.Text) > 5 Then
    MsgBox ("Customer Rating must be between 0-5")
    Else
        Call RateCustomer(rated_customer.customers_id, txtRating.Text)
        MsgBox (rated_customer.customers_name & "Successfully Rated")
        Unload Me
    End If
End Sub

Sub RateCustomer(cus_id As Integer, rate As Integer)
Dim sql As String
    sql = "update ratings set rating=" & rate & " where customer_id=" & cus_id & ""
db.execute (sql)
End Sub

Private Sub Form_Load()
    Label1.Caption = Label1.Caption & rated_customer.customers_name
End Sub
