unit TestunClasseImpostos;

interface

uses
  DUnitX.TestFramework, unClasseImpostos;

type
  [TestFixture]
  TestXunClasseImpostos = class
  strict private
    FImpostoA: TImpostoA;
    FImpostoB: TImpostoB;
    FImpostoC: TImpostoC;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Sample Methods
    // Simple single Test
//    [Test]
//    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestCalculaImposto_A_ValorNegativo','-3000, 0')]
    [TestCase('TestCalculaImposto_A_ValorInteiro','3000, 100')]
    [TestCase('TestCalculaImposto_A_Fracionario','4500.45, 400.09')]
    procedure TestCalculaImpostoA(const AValor, AValorEsperado : Double);

    [Test]
    [TestCase('TestCalculaImposto_B_ValorNegativo','-3000, 0')]
    [TestCase('TestCalculaImposto_B_ValorInteiro','3000, 85')]
    [TestCase('TestCalculaImposto_B_Fracionario','4500.45, 385.09')]
    procedure TestCalculaImpostoB(const AValor, AValorEsperado : Double);

    [Test]
    [TestCase('TestCalculaImposto_C_ValorNegativo','-3000, 0')]
    [TestCase('TestCalculaImposto_C_ValorInteiro','3000, 185')]
    [TestCase('TestCalculaImposto_C_Fracionario','4500.45, 785.18')]
    procedure TestCalculaImpostoC(const AValor, AValorEsperado : Double);
  end;

implementation

procedure TestXunClasseImpostos.Setup;
begin
  FImpostoA := TImpostoA.Create;
  FImpostoB := TImpostoB.Create;
  FImpostoC := TImpostoC.Create;
end;

procedure TestXunClasseImpostos.TearDown;
begin
  FImpostoA.Free;
  FImpostoA := nil;

  FImpostoB.Free;
  FImpostoB := nil;

  FImpostoC.Free;
  FImpostoC := nil;
end;

//procedure TestXunClasseImpostos.Test1;
//begin
//end;

procedure TestXunClasseImpostos.TestCalculaImpostoA(const AValor, AValorEsperado: Double);
begin
  var valorObtido := FImpostoA.CalculaImposto(AValor);
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste do Cálculo A.');
end;

procedure TestXunClasseImpostos.TestCalculaImpostoB(const AValor,
  AValorEsperado: Double);
begin
  var valorObtido := FImpostoB.CalculaImposto(AValor);
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste do Cálculo B.');
end;

procedure TestXunClasseImpostos.TestCalculaImpostoC(const AValor,
  AValorEsperado: Double);
begin
  var valorObtido := FImpostoC.CalculaImposto(AValor);
  Assert.AreEqual<Double>(AValorEsperado, valorObtido, 'Teste do Cálculo C.');
end;

initialization
  TDUnitX.RegisterTestFixture(TestXunClasseImpostos);

end.
