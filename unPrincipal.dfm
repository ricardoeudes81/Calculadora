object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Calculadora'
  ClientHeight = 461
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = CalculadoraKeyPress
  OnShow = FormShow
  TextHeight = 15
  object pnlCalculadora: TPanel
    Left = 0
    Top = 0
    Width = 234
    Height = 300
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 230
    ExplicitHeight = 299
    object edtVisor: TEdit
      Left = 1
      Top = 1
      Width = 232
      Height = 29
      Align = alTop
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 228
    end
    object btn1: TBitBtn
      Left = 8
      Top = 56
      Width = 51
      Height = 41
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 65
      Top = 56
      Width = 51
      Height = 41
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btn2Click
    end
    object btn3: TBitBtn
      Left = 122
      Top = 56
      Width = 51
      Height = 41
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btn3Click
    end
    object btn4: TBitBtn
      Left = 8
      Top = 103
      Width = 51
      Height = 41
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn4Click
    end
    object btn5: TBitBtn
      Left = 65
      Top = 103
      Width = 51
      Height = 41
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn5Click
    end
    object btn6: TBitBtn
      Left = 122
      Top = 103
      Width = 51
      Height = 41
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btn6Click
    end
    object btn7: TBitBtn
      Left = 8
      Top = 150
      Width = 51
      Height = 41
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = btn7Click
    end
    object btn8: TBitBtn
      Left = 65
      Top = 150
      Width = 51
      Height = 41
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btn8Click
    end
    object btn9: TBitBtn
      Left = 122
      Top = 150
      Width = 51
      Height = 41
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btn9Click
    end
    object btn0: TBitBtn
      Left = 65
      Top = 197
      Width = 51
      Height = 41
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = btn0Click
    end
    object btnSoma: TBitBtn
      Left = 179
      Top = 56
      Width = 51
      Height = 41
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btnSomaClick
    end
    object btnSubtracao: TBitBtn
      Left = 179
      Top = 103
      Width = 51
      Height = 41
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btnSubtracaoClick
    end
    object btnMultiplicacao: TBitBtn
      Left = 179
      Top = 150
      Width = 51
      Height = 41
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = btnMultiplicacaoClick
    end
    object btnDivisao: TBitBtn
      Left = 179
      Top = 197
      Width = 51
      Height = 41
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      OnClick = btnDivisaoClick
    end
    object btnResultado: TBitBtn
      Left = 8
      Top = 244
      Width = 165
      Height = 41
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
      OnClick = btnResultadoClick
    end
    object btnClear: TBitBtn
      Left = 8
      Top = 197
      Width = 51
      Height = 41
      Cancel = True
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      OnClick = btnClearClick
    end
    object btnClearEntry: TBitBtn
      Left = 122
      Top = 197
      Width = 51
      Height = 41
      Caption = 'CE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnClick = btnClearEntryClick
    end
    object btnSinalDecimal: TBitBtn
      Left = 179
      Top = 244
      Width = 51
      Height = 41
      Caption = ','
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      OnClick = btnSinalDecimalClick
    end
  end
  object grpImpostos: TGroupBox
    Left = 0
    Top = 300
    Width = 234
    Height = 161
    Align = alBottom
    Caption = 'Impostos'
    TabOrder = 1
    ExplicitTop = 299
    ExplicitWidth = 230
    object btnImpostoA: TBitBtn
      Left = 3
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Imposto A'
      TabOrder = 0
      OnClick = btnImpostoAClick
    end
    object edtImpostoA: TEdit
      Left = 84
      Top = 24
      Width = 146
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
    end
    object btnImpostoB: TBitBtn
      Left = 3
      Top = 55
      Width = 75
      Height = 25
      Caption = 'Imposto B'
      TabOrder = 2
      OnClick = btnImpostoBClick
    end
    object edtImpostoB: TEdit
      Left = 84
      Top = 55
      Width = 146
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
    end
    object btnImpostoC: TBitBtn
      Left = 3
      Top = 86
      Width = 75
      Height = 25
      Caption = 'Imposto C'
      TabOrder = 4
      OnClick = btnImpostoCClick
    end
    object edtImpostoC: TEdit
      Left = 84
      Top = 86
      Width = 146
      Height = 23
      Alignment = taRightJustify
      TabOrder = 5
    end
    object btnLimparImpostos: TBitBtn
      Left = 60
      Top = 121
      Width = 113
      Height = 25
      Caption = 'Limpar Impostos'
      TabOrder = 6
      OnClick = btnLimparImpostosClick
    end
  end
end
