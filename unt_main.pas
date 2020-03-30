unit unt_main;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Ani;

type
  Tfrm_main = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure BoxShowMessage(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateBoxDialog(Alerta: String; TextButton: String);
  end;

var
  frm_main: Tfrm_main;

implementation

{$R *.fmx}
{ Tfrm_main }

procedure Tfrm_main.BoxShowMessage(Sender: TObject);
  begin
    ShowMessage('Interno');
  end;

procedure Tfrm_main.CreateBoxDialog(Alerta: String; TextButton: String);
var
  Box: TRectangle;
  TextMessage: TText;
  AdjustButtonsLyt: TLayout;
  BoxButtonOk: TButton;
  AlphaBackground: TRectangle;

begin
  Box := TRectangle.Create(nil);
  AlphaBackground := TRectangle.Create(nil);
  TextMessage := TText.Create(nil);
  BoxButtonOk := TButton.Create(nil);
  AdjustButtonsLyt := TLayout.Create(nil);

  with AlphaBackground do
  begin
    Parent := frm_main;
    Fill.Color := $C8000000;
    Stroke.Color := TAlphaColorRec.Null;
    Stroke.Thickness := 0;
    Align := TAlignLayout.Client;
    Visible := true;
  end;

  with TextMessage do
  begin
    Parent := Box;
    Align := TAlignLayout.Center;
    Height := 100;
    Width := 200;
    Margins.Top := 10;
    Margins.Bottom := 10;
    Margins.Left := 10;
    Margins.Right := 10;
    Text := Alerta;
  end;

  with BoxButtonOk do
  begin
    Parent := AdjustButtonsLyt;
    Align := TAlignLayout.Right;
    TintColor := TAlphaColorRec.White;
    FontColor := TAlphaColorRec.Aqua;
    Text := TextButton;
    OnClick := Self.BoxShowMessage;
  end;

  with AdjustButtonsLyt do
  begin
    Parent := Box;
    Align := TAlignLayout.Bottom;
    Margins.Bottom := 5;
    Margins.Right := 5;
    Margins.Left := 5;
    Height := 20;
  end;

  with Box do
  begin
    Parent := AlphaBackground;
    Fill.Color := TAlphaColorRec.White;
    Stroke.Thickness := 0;
    Align := TAlignLayout.Center;
    Height := TextMessage.Height + 10;
    Width := TextMessage.Width + 10;
    XRadius := 2;
    YRadius := 2;
  end;

end;

procedure Tfrm_main.FormCreate(Sender: TObject);
  begin
    CreateBoxDialog('Você Concorda com os Termos?','Sim');
  end;
end.
