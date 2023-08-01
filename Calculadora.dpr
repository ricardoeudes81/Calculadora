program Calculadora;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unClasseImpostos in 'Classes\unClasseImpostos.pas',
  unClasseCalculadora in 'Classes\unClasseCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
