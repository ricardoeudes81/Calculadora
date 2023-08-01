unit TestunClasseImpostos;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.SysUtils, unClasseImpostos;

type
  // Test methods for class TImpostoA

  TestTImpostoA = class(TTestCase)
  strict private
    FImpostoA: TImpostoA;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;
  // Test methods for class TImpostoB

  TestTImpostoB = class(TTestCase)
  strict private
    FImpostoB: TImpostoB;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;
  // Test methods for class TImpostoC

  TestTImpostoC = class(TTestCase)
  strict private
    FImpostoC: TImpostoC;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalculaImposto;
  end;

implementation

procedure TestTImpostoA.SetUp;
begin
  FImpostoA := TImpostoA.Create;
end;

procedure TestTImpostoA.TearDown;
begin
  FImpostoA.Free;
  FImpostoA := nil;
end;

procedure TestTImpostoA.TestCalculaImposto;
var
  ReturnValue: Double;
  nValor: Double;
begin
  // TODO: Setup method call parameters
  nValor := 3000;

  ReturnValue := FImpostoA.CalculaImposto(nValor);

  // TODO: Validate method results
  CheckEquals(100, ReturnValue, 'O teste do C�lculo A falhou.');
end;

procedure TestTImpostoB.SetUp;
begin
  FImpostoB := TImpostoB.Create;
end;

procedure TestTImpostoB.TearDown;
begin
  FImpostoB.Free;
  FImpostoB := nil;
end;

procedure TestTImpostoB.TestCalculaImposto;
var
  ReturnValue: Double;
  nValor: Double;
begin
  // TODO: Setup method call parameters
  nValor := 3000;

  ReturnValue := FImpostoB.CalculaImposto(nValor);

  // TODO: Validate method results
  CheckEquals(85, ReturnValue, 'O teste do C�lculo B falhou.');
end;

procedure TestTImpostoC.SetUp;
begin
  FImpostoC := TImpostoC.Create;
end;

procedure TestTImpostoC.TearDown;
begin
  FImpostoC.Free;
  FImpostoC := nil;
end;

procedure TestTImpostoC.TestCalculaImposto;
var
  ReturnValue: Double;
  nValor: Double;
begin
  // TODO: Setup method call parameters
  nValor := 3000;

  ReturnValue := FImpostoC.CalculaImposto(nValor);

  // TODO: Validate method results
  CheckEquals(185, ReturnValue, 'O teste do C�lculo C falhou.');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTImpostoA.Suite);
  RegisterTest(TestTImpostoB.Suite);
  RegisterTest(TestTImpostoC.Suite);
end.

