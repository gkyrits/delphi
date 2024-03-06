program threads;

uses
  Vcl.Forms,
  TimerFrm in 'TimerFrm.pas' {TmForm},
  MngFrm in 'MngFrm.pas' {MngForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TTmForm, TmForm);
  Application.CreateForm(TMngForm, MngForm);
  Application.Run;
end.
