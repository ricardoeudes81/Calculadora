unit unClasseImpostos;

interface

uses
  System.SysUtils;

type

  TCalculo = class abstract
  public
    function CalculaImposto(nValor: Double): Double; virtual; abstract;
  end;

  TImposto = class(TCalculo);


  TImpostoA = class(TImposto)
  public
    function CalculaImposto(nValor: Double): Double; override;
  end;

  TImpostoB = class(TImposto)
  public
    function CalculaImposto(nValor: Double): Double; override;
  end;

  TImpostoC = class(TImposto)
  public
    function CalculaImposto(nValor: Double): Double; override;
  end;

const
  PERCENTUAL_IMP_A = 20;
  DESCONTO_IMP_A = 500;
  DESCONTO_IMP_B = 15;

implementation

{ TImpostoA }

function TImpostoA.CalculaImposto(nValor: Double): Double;
var
  nResultado: Double;
begin
  nResultado := 0;
  try
    if (nValor <= 0) then
      Exit;

    nResultado := (nValor * PERCENTUAL_IMP_A / 100) - DESCONTO_IMP_A;

    if (nResultado < 0) then
      nResultado := 0;

  finally
    Result := nResultado;
  end;
end;

{ TImpostoB }

function TImpostoB.CalculaImposto(nValor: Double): Double;
var
  nResultado: Double;
  ImpA: TImpostoA;
begin
  nResultado := 0;
  ImpA := TImpostoA.Create;
  try
    if (nValor <= 0) then
      Exit;

    nResultado := ImpA.CalculaImposto(nValor) - DESCONTO_IMP_B;

    if (nResultado < 0) then
      nResultado := 0;

  finally
    Result := nResultado;
    if Assigned(ImpA) then
      FreeAndNil(ImpA);
  end;
end;

{ TImpostoC }

function TImpostoC.CalculaImposto(nValor: Double): Double;
var
  nResultado: Double;
  ImpA: TImpostoA;
  ImpB: TImpostoB;
begin
  nResultado := 0;
  ImpA := TImpostoA.Create;
  ImpB := TImpostoB.Create;
  try
    if (nValor <= 0) then
      Exit;

    nResultado := ImpA.CalculaImposto(nValor) + ImpB.CalculaImposto(nValor);

    if (nResultado < 0) then
      nResultado := 0;

  finally
    Result := nResultado;
    if Assigned(ImpA) then
      FreeAndNil(ImpA);
    if Assigned(ImpB) then
      FreeAndNil(ImpB);
  end;
end;

end.
