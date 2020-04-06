{******************************************************************************}
{                   pauloalvis@hotmail.com | github.com/pauloalvis             }
{******************************************************************************}
unit uMain;

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
  Vcl.ExtCtrls;

type
  TForm43 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  end;

var
  Form43: TForm43;

implementation

uses
  pra.messagedlgweb;

{$R *.dfm}

procedure TForm43.Button1Click(Sender: TObject);
begin
  TPraMessageDlgWeb.New //
    .MessageDlgSuccess('Essa é uma mensagem de sucesso');
end;

procedure TForm43.Button2Click(Sender: TObject);
begin
  TPraMessageDlgWeb.New //
    .MessageDlgWarning('Essa é uma mensagem de atenção');
end;

procedure TForm43.Button3Click(Sender: TObject);
begin
  TPraMessageDlgWeb.New //
    .MessageDlgError('Essa é uma mensagem de erro');
end;

procedure TForm43.Button4Click(Sender: TObject);
begin
  if TPraMessageDlgWeb.New //
    .MessageDlgConfirmation('Essa é uma mensagem de pergunta') then
    showmessage('sim')
  else
    showmessage('não');
end;

procedure TForm43.Button5Click(Sender: TObject);
begin
  TPraMessageDlgWeb.New //
    .MessageDlgInformation('Essa é uma mensagem de informação');
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.
