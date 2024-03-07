unit TimerFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Threading;

const
  _SIMPLE=1;
  _THREAD=2;
  _TASK=3;

type
  TTmForm = class(TForm)
    TimerBtn: TButton;
    TimerEdt: TEdit;
    Label1: TLabel;
    CounterLbl: TLabel;
    ClearBtn: TButton;
    Timer1: TTimer;
    test_lbl: TLabel;
    time_lbl: TLabel;
    procedure TimerBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    id: Integer;
    job: TThread;
    task: ITask;
    startTime,jobTime: Cardinal;
    procedure hardJob;
    procedure simpleTimerRun;
    procedure threadTimerRun;
    procedure taskTimerRun;
  public
    { Public declarations }
    counter: Integer;
    int_num: Integer;
    int_str1,int_str2:String;
    timerRun: Boolean;
    runMode: Integer;
    procedure setId(pid: Integer);
    procedure setMode(pmode: Integer);
  end;

var
  //TmForm: TTmForm;
  FPool : TThreadPool;

implementation

{$R *.dfm}

uses MngFrm;

const
  LOOP1=10000;
  LOOP2=2500;  //500 ms

type
  TJobThrd = class(TThread)
  private
    procedure update;
  public
    form: TTmForm;
    procedure Execute; override;
  end;

 TJobTask = class(TTask)
    //...
 end;

//---TJobThrd---------
procedure TJobThrd.Execute;
var i,n:Integer;
begin
  for i := 0 to LOOP1 do
    begin
       form.int_str1:=IntToStr(i);
       for n := 0 to LOOP2 do
          form.int_str2:=IntToStr(n);
       //update;
    end;
end;

procedure TJobThrd.update;
begin
  form.test_lbl.Caption:=form.int_str1;
end;

//---TTmForm------------
procedure TTmForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=false;
  timerRun:=false;
  MngForm.formClosed(id);
end;

procedure TTmForm.setId(pid: Integer);
begin
  id:= pid;
  Caption:='Timer Form '+ IntToStr(id);
end;

procedure TTmForm.setMode(pmode: Integer);
begin
  runMode:= pmode+1;
end;

procedure TTmForm.ClearBtnClick(Sender: TObject);
begin
  counter:=0;
  CounterLbl.Caption:=IntToStr(counter);
end;

procedure TTmForm.hardJob;
var i,n:Integer;
begin
  for i := 0 to LOOP1 do
    begin
       int_str1:=IntToStr(i);
       for n := 0 to LOOP2 do
          int_str2:=IntToStr(n);
    end;
end;

procedure TTmForm.simpleTimerRun;
  var i,n:Integer;
begin
  Timer1.Enabled:=false;
  //deleay job ?
  startTime:= getTickCount;
  for i := 0 to LOOP1 do
    begin
       int_str1:=IntToStr(i);
       {if (i mod 1000) =0 then begin
          Application.ProcessMessages;
          test_lbl.Caption:=int_str1;
       end;}
       for n := 0 to LOOP2 do
          int_str2:=IntToStr(n);
    end;
  test_lbl.Caption:=int_str1;
  inc(counter);
  CounterLbl.Caption:=IntToStr(counter);
  jobTime:= getTickCount-startTime;
  time_lbl.Caption:='['+intToStr(jobTime)+']';
  if timerRun then
    Timer1.Enabled:=true;
end;

procedure TTmForm.threadTimerRun;
begin
  if job=nil then begin
     test_lbl.Caption:='0';
     job:= TJobThrd.Create(true);
     (job as TJobThrd).form:=self;
     //job.Priority:= tpHighest;
     startTime:= getTickCount;
     job.Start;
     exit;
  end
  else begin
      test_lbl.Caption:=int_str1;
      if not job.Finished then exit;
  end;

  test_lbl.Caption:=int_str1;
  job:=nil;
  inc(counter);
  CounterLbl.Caption:=IntToStr(counter);
  jobTime:= getTickCount-startTime;
  time_lbl.Caption:='['+intToStr(jobTime)+']';
end;

procedure TTmForm.taskTimerRun;
begin
  if FPool = nil then begin
    FPool := TThreadPool.Create;
    FPool.SetMaxWorkerThreads(24);
  end;
  if task=nil then begin
    task:= TTask.Create(hardJob,FPool);
    startTime:= getTickCount;
    task.Start;
    exit;
  end
  else begin
      test_lbl.Caption:=int_str1;
      if task.Status<>TTaskStatus.Completed then exit;
  end;

  test_lbl.Caption:=int_str1;
  task:=nil;
  inc(counter);
  CounterLbl.Caption:=IntToStr(counter);
  jobTime:= getTickCount-startTime;
  time_lbl.Caption:='['+intToStr(jobTime)+']';
end;

procedure TTmForm.Timer1Timer(Sender: TObject);
begin
  if runMode=_SIMPLE then
    simpleTimerRun
  else if runMode=_THREAD then
    threadTimerRun
  else if runMode=_TASK then
    taskTimerRun;
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
