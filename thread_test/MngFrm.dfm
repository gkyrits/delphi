object MngForm: TMngForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Manager Form'
  ClientHeight = 151
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 26
    Top = 100
    Width = 65
    Height = 25
    Caption = 'Forms :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 104
    Top = 100
    Width = 11
    Height = 25
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Add_Btn: TButton
    Left = 16
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = Add_BtnClick
  end
  object Remove_Btn: TButton
    Left = 16
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 1
  end
  object Threads_CkBx: TCheckBox
    Left = 104
    Top = 28
    Width = 97
    Height = 17
    Caption = 'Use Threads'
    TabOrder = 2
  end
end
