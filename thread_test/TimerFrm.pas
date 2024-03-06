unit TimerFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TTmForm = class(TForm)
    TimerBtn: TButton;
    TimerEdt: TEdit;
    Label1: TLabel;
    CounterLbl: TLabel;
    ClearBtn: TButton;
    Timer1: TTimer;
    test_lbl: TLabel;
    procedure TimerBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    id: Integer;
    job: TThread;
  public
    { Public declarations }
    counter: Integer;
    int_num: Integer;
    int_str1,int_str2:String;
    timerRun: Boolean;
    procedure setId(pid: Integer);
  end;

{var
  TmForm: TTmForm;}

implementation

{$R *.dfm}

uses MngFrm;

type
  TJobThrd = class(TThread)
  private
    procedure update;
  public
    form: TTmForm;
    procedure Execute; override;
  end;

//---TJobThrd---
procedure TJobThrd.Execute;
var i,n:Integer;
begin
  for i := 0 to 10000 do
    begin
       form.int_str1:=IntToStr(i);
       for n := 0 to 1000 do
          form.int_str2:=IntToStr(n);
       //update;
    end;
end;

procedure TJobThrd.update;
begin
  form.test_lbl.Caption:=form.int_str1;
end;

//---TTmForm---
procedure TTmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MngForm.formClosed(id);
end;

procedure TTmForm.setId(pid: Integer);
begin
  id:= pid;
  Caption:='Timer Form '+ IntToStr(id);
end;

procedure TTmForm.ClearBtnClick(Sender: TObject);
begin
  counter:=0;
  CounterLbl.Caption:=IntToStr(counter);
end;

procedure TTmForm.Timer1Timer(Sender: TObject);
  //var i,n:Integer;
begin
  //Timer1.Enabled:=false;
  //deleay job ?
  {for i := 0 to 10000 do
    begin
       int_str1:=IntToStr(i);
       //Application.ProcessMessages;
       for n := 0 to 1000 do
          int_str2:=IntToStr(n);
    end;}
  if job=nil then begin
     test_lbl.Caption:='0';
     job:= TJobThrd.Create(true);
     (job as TJobThrd).form:=self;
     job.Start;
     exit;
  end
  else
    begin
      test_lbl.Caption:=int_str1;
      if not job.Finished then exit;
    end;

  test_lbl.Caption:=int_str1;
  job:=nil;
  inc(counter);
  CounterLbl.Caption:=IntToStr(counter);
  {if timerRun then
    Timer1.Enabled:=true;}
end;

procedure TTmForm.TimerBtnClick(Sender: TObject);
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
