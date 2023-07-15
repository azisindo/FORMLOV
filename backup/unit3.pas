unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure HandleLOVResult(const Value: string);
  private

  public

  end;

var
  Form1: TForm1;

implementation
uses
  unlov,ULov;


{$R *.lfm}

{ TForm1 }


procedure TForm1.Button3Click(Sender: TObject);
var
  FormLOV: TFormLOV;
  ButtonPos: TPoint;
begin
  ButtonPos := Button3.ClientToScreen(Point(0, 0));
  FormLOV := TFormLOV.Create(Self);

  try
    FormLOV.Left := ButtonPos.X;
    FormLOV.Top :=  ButtonPos.Y + Button3.Height;
    FormLOV.ShowModal;
  finally
    FormLOV.Free;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  //FormLOV: TFormLOV;
  FrmLov:TFrmLov;

  ButtonPos: TPoint;
begin
  ButtonPos := Button1.ClientToScreen(Point(0, 0));
  FormLOV := TFrmLov.Create(Self);

  try
    FormLOV.Left := ButtonPos.X;
    FormLOV.Top :=  ButtonPos.Y + Button3.Height;
    FormLOV.ShowModal;
  finally
    FormLOV.Free;
  end;


end;

procedure TForm1.HandleLOVResult(const Value: string);
begin
  // Disini Anda dapat menggunakan nilai yang dipilih dari LOV
  ShowMessage('Nilai yang dipilih: ' + Value);
end;

{ TForm1 }


end.

