{******************************************************************************}
{                   pauloalvis@hotmail.com | github.com/pauloalvis             }
{******************************************************************************}

unit pra.view.messagedlgweb;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  System.ImageList,
  Vcl.ImgList,
  PraButtonStyle;

type
  TFPraViewMessageDlgWeb = class(TForm)
    imgMessage: TImage;
    imList: TImageList;
    lbMessage: TLabel;
    lbText: TLabel;
    pnBotao: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure OKSimOnClick(Value: TObject);
    procedure NaoOnClick(Value: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

var
  FPraProfessorCommomViewMessage: TFPraViewMessageDlgWeb;

implementation

{$R *.dfm}

procedure TFPraViewMessageDlgWeb.OKSimOnClick(Value: TObject);
begin
  close;

  self.ModalResult := mrOK;
end;

procedure TFPraViewMessageDlgWeb.FormCreate(Sender: TObject);
var
  region: hrgn;
begin
  region := CreateRoundRectRgn(0, 0, width, height, 20, 20);
  setwindowrgn(handle, region, true);
end;

procedure TFPraViewMessageDlgWeb.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
    close;
end;

procedure TFPraViewMessageDlgWeb.NaoOnClick(Value: TObject);
begin
  self.ModalResult := mrNo;

  close;
end;

end.
