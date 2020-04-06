program pramessagedlgweb;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form43},
  pra.commom.interfaces in 'pra.commom.interfaces.pas',
  pra.messagedlgweb in 'pra.messagedlgweb.pas',
  pra.view.messagedlgweb in 'pra.view.messagedlgweb.pas' {FPraViewMessageDlgWeb};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm43, Form43);
  Application.Run;
end.
