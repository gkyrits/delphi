object TmForm: TTmForm
  Left = 0
  Top = 0
  Caption = 'Timer Form 1'
  ClientHeight = 157
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object Label1: TLabel
    Left = 167
    Top = 20
    Width = 16
    Height = 15
    Caption = 'ms'
  end
  object CounterLbl: TLabel
    Left = 8
    Top = 47
    Width = 16
    Height = 37
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object test_lbl: TLabel
    Left = 96
    Top = 46
    Width = 15
    Height = 15
    Caption = '---'
  end
  object TimerBtn: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = TimerBtnClick
  end
  object TimerEdt: TEdit
    Left = 96
    Top = 17
    Width = 65
    Height = 23
    TabOrder = 1
    Text = '100'
  end
  object ClearBtn: TButton
    Left = 8
    Top = 90
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 2
    OnClick = ClearBtnClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 208
    Top = 16
  end
end
