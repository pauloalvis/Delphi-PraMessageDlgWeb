{******************************************************************************}
{                   pauloalvis@hotmail.com | github.com/pauloalvis             }
{******************************************************************************}

unit pra.commom.interfaces;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Data.DB,

  PraButtonStyle;

type
  iPraMessageDlgWeb = interface
    ['{459FC9BF-C2AA-47AD-86BE-929745430506}']
    procedure MessageDlgSuccess(const pText: String);
    procedure MessageDlgInformation(const pText: String);
    procedure MessageDlgWarning(const pText: String);
    procedure MessageDlgError(const pText: String);
    function MessageDlgConfirmation(const pText: String): Boolean;
  end;

implementation

end.
