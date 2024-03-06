unit MngFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TimerFrm;

type
  TMngForm = class(TForm)
    Add_Btn: TButton;
    Remove_Btn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Threads_CkBx: TCheckBox;
    procedure Add_BtnClick(Sender: TObject);
  private
    { Private declarations }
    testForms: Array of TTmForm;
    testTreads: Array of TThread;
    testFrm_len,testTrd_len: Integer;
    procedure addForm;
    procedure addThreadForm;
  public
    { Public declarations }
    procedure formClosed(id: Integer);
  end;

var
  MngForm: TMngForm;


implementation
{$R *.dfm}

type
  TFormThrd = class(TThread)
  private
     form: TTmForm;
  public
    id: Integer;
    procedure Execute; override;
    procedure startForm;
    procedure setId(pid: Integer);
  end;

//----TFormThrd------------------------
procedure TFormThrd.Execute;
begin
  Synchronize(startForm);
  while not Terminated do
    sleep(500);
end;

procedure TFormThrd.startForm;
begin
  form:= TTmForm.Create(Application);
  form.setId(id);
  form.Show;
end;

procedure TFormThrd.setId(pid: Integer);
begin
  id:= pid;
end;

//-----TMngForm-----------------------

procedure TMngForm.formClosed(id: Integer);
begin
  //...
end;

procedure TMngForm.addForm;
begin
  inc(testFrm_len);
  setLength(testForms,testFrm_len);
  testForms[testFrm_len-1]:= TTmForm.Create(Application);
  testForms[testFrm_len-1].setId(testFrm_len);
  testForms[testFrm_len-1].Show;
end;

procedure TMngForm.addThreadForm;
begin
  inc(testTrd_len);
  setLength(testTreads,testTrd_len);
  testTreads[testTrd_len-1]:= TFormThrd.Create(true);
  (testTreads[testTrd_len-1] as TFormThrd).setId(testTrd_len);
  testTreads[testTrd_len-1].Start;
end;

procedure TMngForm.Add_BtnClick(Sender: TObject);
begin
   if Threads_CkBx.Checked then
      addThreadForm
   else
      addForm;

end;

end.
