{ ****************************************************************************** }
{ pauloalvis@hotmail.com | github.com/pauloalvis }
{ ****************************************************************************** }

unit pra.messagedlgweb;

interface

uses
  pra.commom.interfaces,
  Vcl.Dialogs,
  PraButtonStyle,
  pra.view.messagedlgweb;

type
  TPraMessageDlgWeb = class(TInterfacedObject, iPraMessageDlgWeb)
  private
    FFormMessage: TFPraViewMessageDlgWeb;

    procedure MessageDlgSuccess(const pText: String);
    procedure MessageDlgInformation(const pText: String);
    procedure MessageDlgWarning(const pText: String);
    procedure MessageDlgError(const pText: String);
    function MessageDlgConfirmation(const pText: String): Boolean;
    function ShowMessageDlg(const pText: String): Boolean;
    function CreateButton: TPraButtonStyle;

    procedure CreateButton_OK;
    procedure CreateButton_SIM;
    procedure CreateButton_NAO;

    constructor Create;
  public
    destructor Destroy; override;
    class function New: iPraMessageDlgWeb;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Graphics,
  Winapi.Windows;

procedure TPraMessageDlgWeb.MessageDlgWarning(const pText: String);
begin
  FFormMessage.imList.GetBitmap(1, FFormMessage.imgMessage.Picture.bitmap);
  FFormMessage.lbMessage.Caption := 'Atenção';

  CreateButton_OK;

  ShowMessageDlg(pText);
end;

class function TPraMessageDlgWeb.New: iPraMessageDlgWeb;
begin
  result := Self.Create;
end;

function TPraMessageDlgWeb.ShowMessageDlg(const pText: String): Boolean;
begin
  FFormMessage.lbText.Caption := pText;
  result := FFormMessage.ShowModal = mrOk;
end;

constructor TPraMessageDlgWeb.Create;
begin
  FFormMessage := TFPraViewMessageDlgWeb.Create(nil);
end;

function TPraMessageDlgWeb.CreateButton: TPraButtonStyle;
begin
  result := TPraButtonStyle.Create(FFormMessage);

  with result do
  begin
    parent := FFormMessage.pnBotao;
//    Top := 28;
    Top := (parent.Height - Height) div 2;
    Height := 36;
    Cursor := crHandPoint;
    Pen.Style := psClear;
    Font.Charset := DEFAULT_CHARSET;
    Font.Height := -19;
    Font.Name := 'Tahoma';
    Font.Style := [];
    FontFocused.Charset := DEFAULT_CHARSET;
    FontFocused.Height := -19;
    FontFocused.Name := 'Tahoma';
    FontFocused.Style := [];
    FontDown.Charset := DEFAULT_CHARSET;
    FontDown.Height := -19;
    FontDown.Name := 'Tahoma';
    FontDown.Style := [];

    TabStop := True;
  end;
end;

procedure TPraMessageDlgWeb.CreateButton_NAO;
begin
  with CreateButton do
  begin
//    Left := 222;
    Width := 92;
    Left := (parent.Width - 190) div 2;
    Brush.Color := $00AAAAAA;
    BrushFocused.Color := $00989898;
    BrushDown.Color := $00AAAAAA;
    Pen.Style := psClear;
    PenFocused.Width := 3;
    PenFocused.Color := $00D1B27F;
    Font.Color := clWhite;
    FontFocused.Color := clWhite;
    FontDown.Color := clWhite;
    PenDown.Width := 3;
    PenDown.Color := $00D1B27F;
    Caption := 'Não';
    TabOrder := 0;
    onClick := FFormMessage.NaoOnClick;
  end;
end;

procedure TPraMessageDlgWeb.CreateButton_OK;
begin
  with CreateButton do
  begin
//    Left := 254;
    Width := 92;
    Left := (parent.Width - Width) div 2;

    Brush.Color := 13991740;
    BrushFocused.Color := 13136427;
    BrushDown.Color := 13136427;

    Pen.Color := 13395456;
    PenFocused.Color := 13395456;
    PenFocused.Width := 3;

    PenDown.Color := 13395456;
    PenDown.Width := 3;

    Font.Color := clWhite;
    FontFocused.Color := clWhite;
    FontDown.Color := clWhite;

    Caption := 'OK';
    TabOrder := 0;
    onClick := FFormMessage.OKSimOnClick;
  end;
end;

procedure TPraMessageDlgWeb.CreateButton_SIM;
begin
  with CreateButton do
  begin
    Width := 92;
//    Left := (parent.Width - ) div 2;
    Left := 203;

    Brush.Color := 13991740;
    BrushFocused.Color := 13136427;
    BrushDown.Color := 13991740;

    Pen.Color := 13395456;
    PenFocused.Color := 13395456;
    PenFocused.Width := 3;

    PenDown.Color := 13395456;
    PenDown.Width := 3;
    FontDown.Color := clWhite;

    Font.Color := clWhite;
    FontFocused.Color := clWhite;

    Caption := 'Sim';
    TabOrder := 1;
    onClick := FFormMessage.OKSimOnClick;
  end;
end;

destructor TPraMessageDlgWeb.Destroy;
begin
  FreeandNil(FFormMessage);

  inherited;
end;

function TPraMessageDlgWeb.MessageDlgConfirmation(const pText: String): Boolean;
begin
  FFormMessage.imList.GetBitmap(3, FFormMessage.imgMessage.Picture.bitmap);
  FFormMessage.lbMessage.Caption := 'Pergunta';

  CreateButton_SIM;
  CreateButton_NAO;

  result := ShowMessageDlg(pText);
end;

procedure TPraMessageDlgWeb.MessageDlgError(const pText: String);
begin
  FFormMessage.imList.GetBitmap(2, FFormMessage.imgMessage.Picture.bitmap);
  FFormMessage.lbMessage.Caption := 'Erro';

  CreateButton_OK;

  ShowMessageDlg(pText);
end;

procedure TPraMessageDlgWeb.MessageDlgInformation(const pText: String);
begin
  FFormMessage.imList.GetBitmap(4, FFormMessage.imgMessage.Picture.bitmap);
  FFormMessage.lbMessage.Caption := 'Informação';

  CreateButton_OK;

  ShowMessageDlg(pText);
end;

procedure TPraMessageDlgWeb.MessageDlgSuccess(const pText: String);
begin
  FFormMessage.imList.GetBitmap(0, FFormMessage.imgMessage.Picture.bitmap);
  FFormMessage.lbMessage.Caption := 'Sucesso';

  CreateButton_OK;

  ShowMessageDlg(pText);
end;

end.
