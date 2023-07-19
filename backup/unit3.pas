unit unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  StdCtrls,uconnect,Db,ZDataset,uSetVarGlobal;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure HandleLOVResult(const Value: TStringList);
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

procedure TForm1.Edit1Enter(Sender: TObject);
var
  FrmLov:TFrmLov;
  ButtonPos: TPoint;

  Connect:Tconnect;
  SqlLov :TZQuery;
  //uses uconnect,Db,ZDataset,uSetVarGlobal;

begin
  Connect := TConnect.Create();
  try
    if Connect.Connect then
    begin
      //Sql Query
      SqlLov :=Connect.ExecuteQuery('Select * from '+SetVarGlobal.Db1+'ms_forms');
      //seting untuk nama kolom

      if SqlLov<> Nil then
      begin
        //Menngunakan TDataSource yang telah ditambahkan
        Connect.DataSource.DataSet := SqlLov ;

        ButtonPos := Edit1.ClientToScreen(Point(0, 0));   //disesuaikan dengan objet yang akan di jadikan LOV nya
        FrmLov    := TFrmLov.Create(Self);

        try
          //Judul LOV
          FrmLov.Caption:='Lov Master Barang';
          FrmLov.Left := ButtonPos.X;
          FrmLov.Top  := ButtonPos.Y + Button3.Height;
//          FrmLov.LoadDataToDbGrid(Connect.DataSource);
          FrmLov.OnSelectValues := @HandleLOVResult;
          FrmLov.ShowModal;
        finally
          FrmLov.Free;
        end;
      end;
    end;
  finally
    Connect.Free;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  FrmLov:TFrmLov;
  ButtonPos: TPoint;
  vSqlForms:string;
  //uses uconnect,Db,ZDataset;
begin
  ButtonPos := Button1.ClientToScreen(Point(0, 0));
  FrmLov    := TFrmLov.Create(Self);
  try
    //Judul LOV
    vSqlForms :='Select * from '+SetVarGlobal.Db1  +'.ms_forms ';

    FrmLov.Caption :='Lov Master Barang';
    FrmLov.SqlLov  := vSqlForms;
    FrmLov.SetJudulLov :='master';
    FrmLov.Left    := ButtonPos.X;
    FrmLov.Top     := ButtonPos.Y + Button3.Height;
    FrmLov.OnSelectValues := @HandleLOVResult;
    FrmLov.ShowModal;
  finally
    FrmLov.Free;
  end;

 end;

procedure TForm1.HandleLOVResult(const Value: TStringList);
begin
  // Disini Anda dapat menggunakan nilai yang dipilih dari LOV
  ShowMessage('Nilai yang dipilih: ' + Value[0]);
  edit1.Caption:=Value[0];
end;


{ TForm1 }


end.

