VERSION 5.00
Object = "{8E27C92E-1264-101C-8A2F-040224009C02}#7.0#0"; "MSCAL.OCX"
Begin VB.Form frmCalendar 
   Appearance      =   0  'Flat
   BackColor       =   &H001ED2C5&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Calendar"
   ClientHeight    =   4620
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4995
   Icon            =   "frmCalendar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4620
   ScaleWidth      =   4995
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSACAL.Calendar Calendar1 
      Height          =   4515
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4875
      _Version        =   524288
      _ExtentX        =   8599
      _ExtentY        =   7964
      _StockProps     =   1
      BackColor       =   13106931
      Year            =   2012
      Month           =   10
      Day             =   2
      DayLength       =   1
      MonthLength     =   2
      DayFontColor    =   0
      FirstDay        =   7
      GridCellEffect  =   1
      GridFontColor   =   10485760
      GridLinesColor  =   -2147483632
      ShowDateSelectors=   -1  'True
      ShowDays        =   -1  'True
      ShowHorizontalGrid=   -1  'True
      ShowTitle       =   -1  'True
      ShowVerticalGrid=   -1  'True
      TitleFontColor  =   10485760
      ValueIsNull     =   -1  'True
      BeginProperty DayFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty GridFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmCalendar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Calendar1_Click()
If whichDate = STOCK_IN_DATE Then
    activedatelabel.Caption = Calendar1.value
    
Else
    activeDateTextbox.Text = FormatDateTime(Calendar1.value, vbShortDate)
End If
    activeDate = Calendar1.value
    
Unload Me
End Sub

Private Sub Form_Load()
    Dim temp As String
    Dim a As String
        a = frmViewSales.txtSalesDate.Text
    If frmViewSales.txtSalesDate.Text <> "" Then
        Calendar1.ValueIsNull = False
        Calendar1.value = a
    Else
        Calendar1.value = Date
    End If
End Sub
