unit TimerFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    TimerBtn: TButton;
    TimerEdt: TEdit;
    Label1: TLabel;
    CounterLbl: TLabel;
    ClearBtn: TButton;
    Timer1: TTimer;
    procedure TimerBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    counter: Integer;
    int_num: Integer;
    int_str1,int_str2:String;
    timerRun: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClearBtnClick(Sender: TObject);
begin
  counter:=0;
  CounterLbl.Caption:=IntToStr(counter);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
  var i,n:Integer;
begin
  Timer1.Enabled:=false;
  //deleay job ?
  for i := 0 to 10000 do
    begin
       int_str1:=IntToStr(i);
       //Application.ProcessMessages;
       for n := 0 to 1000 do
          int_str2:=IntToStr(n);
    end;
  inc(counter);
  CounterLbl.Caption:=IntToStr(counter);
  if timerRun then
    Timer1.Enabled:=true;
end;

procedure TForm1.TimerBtnClick(Sender: TObject);
  var time_val,err:Integer;
begin
  if not timerRun then begin
    val(TimerEdt.Text,time_val,err);
    if err >0 then exit;
    if time_val<5 then time_val:=5;
    Timer1.Interval := time_val;
    Timer1.Enabled:=true;
    TimerBtn.Caption:='Stop';
    timerRun:=true;
  end
  else begin
    timerRun:=false;
    Timer1.Enabled:=false;
    TimerBtn.Caption:='Start';
  end;
end;

end.