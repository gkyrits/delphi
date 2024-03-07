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
    FormCount_Lbl: TLabel;
    Mode_Bx: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    CpuCount_Lbl: TLabel;
    procedure Add_BtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    testForms: Array of TTmForm;
    testFrm_len: Integer;
    cpu_cnt: Integer;
    procedure addForm;
  public
    { Public declarations }
    procedure formClosed(id: Integer);
  end;

  TLoadThread = class(TThread)
  public
    class var Stop: Boolean;
  protected
    procedure Execute; override;
  public
    count:Integer;
    cnt_str:String;
    constructor Create;
  end;

var
  MngForm: TMngForm;


implementation
{$R *.dfm}

//-----TLoadThread-----------------------
constructor TLoadThread.Create;
begin
  inherited Create;
  FreeOnTerminate:= True;
end;

procedure TLoadThread.Execute;
begin
  repeat
    inc(count);
    if count>100000 then
      count:=0;
    //cnt_str:=IntToStr(count);
    {if (count mod 2)=0 then
      cnt_str:='alfa'
    else
      cnt_str:='bhta';}
  until Stop;
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
  testForms[testFrm_len-1].setMode(Mode_Bx.ItemIndex);
  testForms[testFrm_len-1].Show;
  FormCount_Lbl.Caption:=IntToStr(testFrm_len);
end;

procedure TMngForm.Add_BtnClick(Sender: TObject);
begin
      addForm;
end;



//-----------------------------
procedure LoadCPU;
begin
  TLoadThread.Stop:= False;
  TLoadThread.Create;
end;

procedure TMngForm.Button1Click(Sender: TObject);
begin
  LoadCPU;
  inc(cpu_cnt);
  CpuCount_Lbl.Caption:=IntToStr(cpu_cnt);
end;

procedure TMngForm.Button2Click(Sender: TObject);
begin
  TLoadThread.Stop:= True;
  cpu_cnt:=0;
  CpuCount_Lbl.Caption:=IntToStr(cpu_cnt);
end;

end.
